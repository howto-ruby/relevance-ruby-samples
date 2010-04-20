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
  def test_fetch_with_index
    letters = ['a', 'b', 'c']
    assert_equal 'b', letters.fetch(1)
    assert_raises(IndexError) { letters.fetch(3) }
  end
  # codecite fetchindex
  
  # codecite fetchdefault
  def test_fetch_with_default
    letters = ['a', 'b', 'c']
    assert_equal 'b', letters.fetch(1, 'z')
    assert_equal 'z', letters.fetch(3, 'z')
  end
  # codecite fetchdefault
  
  # codecite fetchblock
  def test_fetch_with_block
    letters = ['a', 'b', 'c']
    assert_equal 'b', letters.fetch(1){|index| flunk "Block should not have been called!" }
    
    result = letters.fetch(3) do |index|
      assert_equal 3, index
      'x'
    end
    assert_equal 'x', result
  end
  # codecite fetchblock
end
