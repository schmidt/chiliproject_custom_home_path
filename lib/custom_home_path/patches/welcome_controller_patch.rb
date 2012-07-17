require_dependency 'welcome_controller'

module CustomHomePath::WelcomeControllerPatch
  def self.included(base)
    base.class_eval do
      unloadable
      include InstanceMethods

      alias_method_chain :index, :custom_home_path
    end
  end

  module InstanceMethods
    def index_with_custom_home_path
      path = Setting.plugin_custom_home_path['path']
      if path.blank? or path == '/'
        index_without_custom_home_path
      else
        redirect_to path
      end
    end
  end
end

WelcomeController.send(:include, CustomHomePath::WelcomeControllerPatch)
