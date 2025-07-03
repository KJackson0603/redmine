Redmine::Plugin.register :auto_clone_on_status_change_dynamic do
  name 'Auto Clone On Status Change Dynamic'
  author 'KJackson'
  description 'Automatically clone issues when certain status changes, with dynamic configuration'
  version '0.2.0'
  settings partial: 'settings/auto_clone_settings', default: {}
end

require_relative 'lib/auto_clone_on_status_change_dynamic/hooks/auto_clone_hook'
