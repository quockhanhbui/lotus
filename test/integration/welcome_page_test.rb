require 'test_helper'
require 'rack/test'
require 'fixtures/welcome_app/application'

describe 'Welcome page' do
  include Rack::Test::Methods

  before do
    @current_dir = Dir.pwd
    Dir.chdir FIXTURES_ROOT.join('welcome_app')
    @app = WelcomeApp::Application.new
  end

  after do
    Dir.chdir @current_dir
    @current_dir = nil
  end

  def app
    @app
  end

  def response
    last_response
  end

  it 'shows a welcome page when no routes were set' do
    get '/'

    response.status.must_equal 200
    response.body.must_include %(Lotus)
  end
end
