require 'redmine'
require_dependency 'supy_issue_hook'
RAILS_DEFAULT_LOGGER.info 'Starting Supybot plugin for RedMine'
Redmine::Plugin.register :redmine_supy do
  name 'Redmine Supy plugin'
  author 'Nagy Karoly Gabriel'
  description 'Announce to Supybot via ExternalControl'
  version '0.0.1'
end

