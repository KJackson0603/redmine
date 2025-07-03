module AutoCloneOnStatusChangeDynamic
  module Hooks
    class AutoCloneHook < Redmine::Hook::Listener
      def controller_issues_edit_after_save(context = {})
        issue = context[:issue]
        return unless issue

        settings = Setting.plugin_auto_clone_on_status_change_dynamic
        rules = settings['rules'] || {}

        rules.values.each do |rule|
          if rule['source_tracker'].to_s.strip == issue.tracker.name &&
             rule['source_status'].to_s.strip == issue.status.name

            target_tracker = Tracker.find_by(name: rule['target_tracker'].to_s.strip)
            next unless target_tracker

			default_status_id = IssueStatus.order(:position).pluck(:id).first

            Issue.create!(
              project_id: issue.project_id,
              tracker_id: target_tracker.id,
              author: issue.author,
              subject: "[복사됨] #{issue.subject}",
              description: issue.description,
              status_id: default_status_id,
              start_date: Date.today
            )
			
			Rails.logger.info "[AutoClonePlugin] '#{issue.subject}' 이슈 복제 완료"
          end
        end
      rescue => e
        Rails.logger.error "[AutoClonePlugin] 자동 생성 중 오류: #{e.message}"
      end
    end
  end
end
