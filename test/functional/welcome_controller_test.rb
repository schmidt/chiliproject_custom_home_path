require File.dirname(__FILE__) + '/../test_helper'

class WelcomeControllerTest < ActionController::TestCase
  # Avoid bugs based on Setting cache
  old_cache_value = nil

  setup do
    old_cache_value = Setting.use_caching?
    Setting.use_caching = false
  end

  teardown do
    Setting.use_caching = old_cache_value
  end

  context "when set to '/'" do
    setup do
      Setting.plugin_custom_home_path = {'path' => '/'}
    end

    should 'render welcome/index' do
      get :index
      assert_template 'index'
    end
  end

  context "when set to empty string" do
    setup do
      Setting.plugin_custom_home_path = {'path' => ''}
    end

    should 'render welcome/index' do
      get :index
      assert_template 'index'
    end
  end

  context "when set to any other string" do
    setup do
      Setting.plugin_custom_home_path = {'path' => '/my/page'}
    end

    should 'redirect to /my/page' do
      get :index
      assert_redirected_to :controller => 'my', :action => 'page'
    end
  end
end
