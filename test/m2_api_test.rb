require 'test_helper'
require 'webmock/test_unit'
require 'mocha/test_unit'
require 'rack/test'

require 'smart_proxy_m2/m2'
require 'smart_proxy_m2/m2_api'

class M2ApiTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Proxy::M2::Api.new
  end

  def test_returns_test_greeting
    Proxy::M2::Plugin.load_test_settings('test_msg' => 'test')
    assert get('/test').body == 'test'
  end

end
