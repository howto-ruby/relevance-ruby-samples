require "#{File.dirname(__FILE__)}/../test_helper"
require "relevance/tarantula"

class TarantulaTest < ActionController::IntegrationTest
  fixtures :all

  def test_tarantula
    t = tarantula_crawler(self)
    attack = { 
      :name => :script,
      :input => "<script>Sneaky code</script>",
      :output => "<script>Sneaky code</script>"
    }
    XssFormSubmission.attacks << attack
    t.handlers << XssDocumentCheckerHandler.new
    t.fuzzers << XssFormSubmission
    t.times_to_crawl = 2
    t.crawl "/posts"
  end
end
