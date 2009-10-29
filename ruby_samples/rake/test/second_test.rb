require 'test/unit'

class SecondTest < Test::Unit::TestCase

  def test_math
    assert_equal 30, 10*3
  end
  
  def test_strings
    assert_match /^foo/, "foot"
  end
end
