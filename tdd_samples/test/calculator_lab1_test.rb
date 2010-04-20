require File.dirname(__FILE__) + '/test_helper'
require 'calculator'

class CalculatorTest < Test::Unit::TestCase
  def c
    @calculator ||= Calculator.new
  end
  
  # ------------------------------------------------------- calc
  
  def test_number
    assert_equal 2, c.calc("2")
    assert_equal 4, c.calc("4")
  end

  def test_numbers_with_space
    assert_equal 2, c.calc(" 2")
    assert_equal 4, c.calc("4 ")
    assert_equal 6, c.calc(" 6 ")
  end

  def test_invalid_number
    assert_raises(Calculator::ParseError) { c.calc("1a") }
  end

  def test_addition
    assert_equal 5, c.calc("3+2")
  end
  
  def test_subtraction
    assert_equal 1, c.calc("3-2")
  end

  def test_multiplication
    assert_equal 6, c.calc("3*2")
  end

  def test_division
    assert_equal 3, c.calc("6/2")
  end

  # ------------------------------------------------------ parse
  
  def test_parse_num
    assert_equal [:num, 2], c.parse("2")
    assert_equal [:num, 3], c.parse(" 3 ")
  end

  def test_parse_addition
    assert_equal [:+, [:num, 1], [:num, 2]], c.parse("1+2")
    assert_equal [:+, [:num, 3], [:num, 4]], c.parse(" 3 + 4 ")
  end

  def test_parse_subtraction
    assert_equal [:-, [:num, 1], [:num, 2]], c.parse("1-2")
    assert_equal [:-, [:num, 3], [:num, 4]], c.parse(" 3 - 4 ")
  end
  
  def test_parse_multiplication
    assert_equal [:*, [:num, 1], [:num, 2]], c.parse("1*2")
    assert_equal [:*, [:num, 3], [:num, 4]], c.parse(" 3 * 4 ")
  end
  
  def test_parse_division
    assert_equal [:/, [:num, 1], [:num, 2]], c.parse("1/2")
    assert_equal [:/, [:num, 3], [:num, 4]], c.parse(" 3 / 4 ")
  end

  def test_parse_exp
    assert_equal [:"^", [:num, 1], [:num, 2]], c.parse("1^2")
    assert_equal [:"^", [:num, 3], [:num, 4]], c.parse(" 3 ^ 4 ")
  end

  def test_parse_error
    assert_raises(Calculator::ParseError) { c.parse("1b") }
  end
  
  # --------------------------------------------------- evaluate

  def test_tree_num
    assert_equal 2, c.evaluate([:num, 2])
    assert_equal 3, c.evaluate([:num, 3])
  end
  
  def test_tree_plus
    assert_equal 5, c.evaluate([:+, [:num, 3], [:num, 2]])
    assert_equal 3, c.evaluate([:+, [:num, 2], [:num, 1]])
  end
  
  def test_tree_minus
    assert_equal 1, c.evaluate([:-, [:num, 3], [:num, 2]])
    assert_equal 1, c.evaluate([:-, [:num, 2], [:num, 1]])
  end

  def test_tree_times
    assert_equal 6, c.evaluate([:*, [:num, 3], [:num, 2]])
    assert_equal 9, c.evaluate([:*, [:num, 3], [:num, 3]])
  end

  def test_tree_divide
    assert_equal 3, c.evaluate([:/, [:num, 6], [:num, 2]])
    assert_equal 5, c.evaluate([:/, [:num, 15], [:num, 3]])
  end

  def test_tree_exponentiate
    assert_equal 9, c.evaluate([:"^", [:num, 3], [:num, 2]])
    assert_equal 8, c.evaluate([:"^", [:num, 2], [:num, 3]])
  end
  
  def test_tree_invalid
    assert_raises(Calculator::ParseError) { c.evaluate([:foo]) }
  end
end
