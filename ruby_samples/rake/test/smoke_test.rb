require 'test/unit'

class SmokeTest < Test::Unit::TestCase

  def test_failing
    flunk "Add a real test"
  end
  
  def test_passing
    assert_equal 1, 1.0
  end
end
