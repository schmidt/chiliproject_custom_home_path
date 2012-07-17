require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare do
  require_dependency 'custom_home_path/patches/welcome_controller_patch'
end

Redmine::Plugin.register :custom_home_path do
  name 'Custom Home Path for ChiliProject'
  author 'Gregor Schmidt'
  description "A plugin to make the home page of your ChiliProject " +
              "a redirect to an arbitrary path"
  version '1.0.0'

  settings :default => {
              'path' => '/'
            },
           :partial => 'settings/custom_home_path'
end

