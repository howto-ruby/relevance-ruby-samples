require "#{File.dirname(__FILE__)}/../test_helper"
require "relevance/tarantula"

class TarantulaTest < ActionController::IntegrationTest
  fixtures :all
  include Relevance::Tarantula
  
  def test_tarantula
    post '/users/login', :login => 'quentin', :password => 'test'
    follow_redirect!
    attack = { :name => 'script', 
      :input => '<script>Banzai!</script>',
      :output => '<script>Banzai!</script>'}
    XssFormSubmission.attacks << attack
    t = tarantula_crawler(self)
    t.handlers << XssDocumentCheckerHandler.new
    t.fuzzers << XssFormSubmission
    t.times_to_crawl = 2
    t.crawl "/"
  end
end
