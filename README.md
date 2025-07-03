# redmine
Welcome, this is a repository containing developments related to Redmine. (for hobby)

Please refer to the items below before applying the plugins.

Environment:
  Redmine version                6.0.4.stable
  Ruby version                   3.3.8-p144 (2025-04-09) [x86_64-linux]
  Rails version                  7.2.2.1
  Environment                    production
  Database adapter               PostgreSQL
  Mailer queue                   ActiveJob::QueueAdapters::AsyncAdapter
  Mailer delivery                smtp
Redmine settings:
  Redmine theme                  Default

 Development Server Configuration

 🧱 Proxmox (Hypervisor)

┌──────────────────────────────────────┐
│       Rocky Linux 9.0 (Virtual Machine / VM)      │  ← VM created with Proxmox
│                                              │
│   ┌──────────────────────────────┐            │
│   │       Docker Daemon (dockerd)         │  ← Always running as a Linux service
│   └──────────────────────────────┘            │
│                                              │
│   ┌──────────────┐   ┌────────────────┐       │
│   │  Redmine Container  │   │ PostgreSQL Container │   │  ← Each app is isolated in its own container
│   └──────────────┘   └────────────────┘       │
└──────────────────────────────────────┘


