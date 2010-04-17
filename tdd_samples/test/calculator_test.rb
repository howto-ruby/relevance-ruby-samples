# In a TDD scenario, you end up writing many versions of the same method
# as you grow the capability of your code and refactor to keep things clean.
# I want to show all of those steps.  Therefore this file contains a lot of
# redefinitions, showing early versions and then redefining them with later
# versions.
#
# This means that changes down the line may break some of the early versions,
# but that breakage will be hidden by the later versions.  I don't yet know
# how to deal with this problem.  Suggestions welcome.  ---glv

# codecite calctest
require File.dirname(__FILE__) + '/test_helper'
require 'calculator'

class CalculatorTest < Test::Unit::TestCase
  # codecite calctest

  # codecite number1
  def test_number
    assert_equal 2, Calculator.new.calc("2")
  end
  # codecite number1
  
  # codecite number2
  def test_number
    assert_equal 2, Calculator.new.calc("2")
    assert_equal 4, Calculator.new.calc("4")
  end
  # codecite number2
  
  # codecite numberspace
  def test_numbers_with_space
    assert_equal 2, Calculator.new.calc(" 2")
    assert_equal 4, Calculator.new.calc("4 ")
    assert_equal 6, Calculator.new.calc(" 6 ")
  end
  # codecite numberspace
end

# codecite helper
class CalculatorTest < Test::Unit::TestCase
  def c
    @calculator ||= Calculator.new
  end
  
  def test_number
    assert_equal 2, c.calc("2")
  end

  def test_number
    assert_equal 2, c.calc("2")
    assert_equal 4, c.calc("4")
  end

  def test_numbers_with_space
    assert_equal 2, c.calc(" 2")
    assert_equal 4, c.calc("4 ")
    assert_equal 6, c.calc(" 6 ")
  end
end
# codecite helper

class NotReallyATest
  # codecite exploreinvalid
  def test_invalid_number
    assert_equal 10, c.calc("abc")
  end
  # codecite exploreinvalid
end

class CalculatorTest
  # codecite invalidnumber
  def test_invalid_number
    assert_raises(Calculator::ParseError) { c.calc("abc") }
  end
  # codecite invalidnumber
  
  # codecite addition
  def test_addition
    assert_equal 5, c.calc("3+2")
  end
  # codecite addition
  
  # codecite calc_ops
  def test_subtraction
    assert_equal 1, c.calc("3-2")
  end

  def test_multiplication
    assert_equal 6, c.calc("3*2")
  end

  def test_division
    assert_equal 3, c.calc("6/2")
  end
  # codecite calc_ops
  
  # codecite parse_num
  def test_parse_num
    assert_equal [:num, 2], c.parse("2")
    assert_equal [:num, 3], c.parse(" 3 ")
  end
  # codecite parse_num
  
  # codecite parse_add
  def test_parse_addition
    assert_equal [:+, [:num, 1], [:num, 2]], c.parse("1+2")
    assert_equal [:+, [:num, 3], [:num, 4]], c.parse(" 3 + 4 ")
  end
  # codecite parse_add
  
  # codecite parse_ops
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
  # codecite parse_ops
  
  # codecite parse_exp
  def test_parse_exp
    assert_equal [:"^", [:num, 1], [:num, 2]], c.parse("1^2")
    assert_equal [:"^", [:num, 3], [:num, 4]], c.parse(" 3 ^ 4 ")
  end
  # codecite parse_exp
  
  # codecite parse_error
  def test_parse_error
    assert_raises(Calculator::ParseError) { c.parse("abc") }
  end
  # codecite parse_error
  
  # codecite evaluate
  def test_tree_num
    assert_equal 2, c.evaluate([:num, 2])
    assert_equal 3, c.evaluate([:num, 3])
  end
  
  def test_tree_plus
    assert_equal 5, c.evaluate([:+, [:num, 3], [:num, 2]])
    assert_equal 3, c.evaluate([:+, [:num, 2], [:num, 1]])
  end
  
  def test_tree_invalid
    assert_raises(Calculator::ParseError) { c.evaluate([:foo]) }
  end
  # codecite evaluate
  
  # codecite tree_ops
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
  # codecite tree_ops
  
  # codecite tree_exp
  def test_tree_exponentiate
    assert_equal 9, c.evaluate([:"^", [:num, 3], [:num, 2]])
    assert_equal 8, c.evaluate([:"^", [:num, 2], [:num, 3]])
  end
  # codecite tree_exp
  
end
