require "#{File.dirname(__FILE__)}/../test_helper"
require "relevance/tarantula"

class TarantulaTest < ActionController::IntegrationTest
  fixtures :all

  def test_tarantula
    post '/users/login', :login => 'quentin', :password => 'test'
    follow_redirect!
    tarantula_crawl(self)
  end
end
