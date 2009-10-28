require File.join(File.dirname(__FILE__), "test_helper.rb")
require 'collections/sequence'

# codecite accessors
class Sequence
  attr_accessor :size, :so_far
end
# codecite accessors

class SequenceTest < Test::Unit::TestCase  
  # codecite generate_next
  def test_generate_next
    s = Sequence.new(2, 1, 2) do |a| 
      assert_equal [1, 2], a;
      a.last+1
    end
    assert_equal 3, s.generate_next
    s = Sequence.new(2, 1) {|a| -a.last}
    assert_equal -1, s.generate_next
  end
  # codecite generate_next
  
  # codecite get_element
  def test_get_element_nil_if_done
    s = Sequence.new(2, 1) {}
    assert_nil s[2]
  end
  
  def test_get_element_generate_if_needed
    s = Sequence.new(4, 1) {|a| 5}
    assert_equal [1], s.so_far
    s[1]
    assert_equal [1, 5], s.so_far
    s[3]
    assert_equal [1, 5, 5, 5], s.so_far
  end
  
  def test_get_element_return_next
    s = Sequence.new(2, 1) {|a| 5}
    assert_equal 1, s[0]
    assert_equal 5, s[1]  
  end
  # codecite get_element

  # codecite each
  def test_each
    # codecite examples
    evens = Sequence.new(5, 2) {|a| a.last + 2} 
    odds  = Sequence.new(5, 1) {|a| a.last + 2}
    fibs  = Sequence.new(5, 1, 1) {|a| a[-2] + a[-1]}
    # codecite examples
    
    assert_equal [2,4,6,8,10], evens.to_a
    assert_equal [1,3,5,7,9],  odds.to_a
    assert_equal [1,1,2,3,5],  fibs.to_a
  end
  # codecite each  
end