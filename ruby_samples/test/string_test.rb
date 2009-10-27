require 'test/unit'

class StringTest < Test::Unit::TestCase
  # codecite string
  def test_string_identity
    assert_not_same("foo", "foo")
  end
  # codecite string
  
  # codecite symbol
  def test_symbol_identity
    assert_same(:foo, "oof".reverse.to_sym)
  end
  # codecite symbol
end