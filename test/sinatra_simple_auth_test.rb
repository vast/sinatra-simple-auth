require 'sinatra_app'
require 'test/unit'
require 'rack/test'
begin; require 'turn/autorun'; rescue LoadError; end

set :environment, :test
enable :sessions

class SinatraSimpleAuthTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_should_login_and_redirect
    post '/a', {:password => app.password}
    assert_redirect app.home
  end

  def test_it_should_fail_login_and_redirect
    post '/a', {:password => 'some fake data'}
    assert_redirect '/a'
  end

  def test_it_should_login_and_redirect_back
    get '/pvt'
    assert_redirect '/a'
    login!
    assert_redirect '/pvt'
  end

  def test_it_should_logout
    login!
    delete '/a'
    assert_redirect '/'
  end

  def test_authorized_helper_should_work
    get '/public'
    assert last_response.body.include?("Please login")
    login!
    get '/public'
    assert last_response.body.include?("%username%")
  end

  protected
  def login!
    post '/a', {:password => app.password}
  end

  def assert_redirect(path)
    assert last_response.redirect?
    assert_equal path, last_response.headers['Location'].sub('http://example.org', '')
  end
end