# codecite dummy
require File.dirname(__FILE__) + '/test_helper.rb'

class ArrayTest < Test::Unit::TestCase
  def test_passing
    assert_equal "foo", "foo"
  end
end
# codecite dummy

class ArrayTest < Test::Unit::TestCase
  
  # codecite empty
  def test_empty?
    assert [].empty?
    assert_equal false, [1].empty?
  end
  # codecite empty
  
  # codecite compact
  def test_compact
    assert_equal [1, 2], [nil, 1, 2].compact
    assert_equal [1, 2], [1, 2, nil].compact
    assert_equal [1, 2], [1, nil, 2].compact
    assert_equal [1, 2], [nil, 1, nil, nil, 2, nil].compact
  end
  # codecite compact
  
  # codecite fetchindex
  def test_fetch_index
    assert_equal 2, [1, 2, 3].fetch(1)
    assert_raises(IndexError) { [1, 2, 3].fetch(3) }
  end
  # codecite fetchindex
  
  # codecite fetchdefault
  def test_fetch_with_default
    assert_equal 2, [1, 2, 3].fetch(1, 4)
    assert_equal 4, [1, 2, 3].fetch(3, 4)
  end
  # codecite fetchdefault
  
  # codecite fetchblock
  def test_fetch_with_block
    assert_equal 2, [1, 2, 3].fetch(1){|index| flunk "Block should not have been called!" }
    
    assert_equal 4, [1, 2, 3].fetch(3){|index| assert_equal 3, index; 4 }
  end
  # codecite fetchblock
end
