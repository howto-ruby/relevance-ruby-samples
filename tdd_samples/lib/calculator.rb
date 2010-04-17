# In a TDD scenario, you end up writing many versions of the same method
# as you grow the capability of your code and refactor to keep things clean.
# I want to show all of those steps.  Therefore this file contains a lot of
# redefinitions, showing early versions and then redefining them with later
# versions.
#
# This means that changes down the line may break some of the early versions,
# but that breakage will be hidden by the later versions.  I don't yet know
# how to deal with this problem.  Suggestions welcome.  ---glv

# codecite dumbnum
class Calculator
  def calc(expr)
    2
  end
end
# codecite dumbnum

class Calculator
  # codecite bindings
  def bindings
    @bindings ||= {}
  end
  # codecite bindings
  
  # codecite smarternum
  def calc(expr)
    Integer(expr)
  end
  # codecite smarternum
  
  # codecite parseerror
  class ParseError < StandardError; end
  
  def calc(expr)
    raise ParseError unless expr =~ /^\s*\d+\s*$/
    Integer(expr)
  end
  # codecite parseerror
  
  # codecite addition1
  def calc(expr)
    case expr
    when /^\s*\d+\s*$/
      Integer(expr)
    when /^\s*(\d+)\s*\+\s*(\d+)\s*/
      Integer($1) + Integer($2)
    else
      raise ParseError
    end
  end
  # codecite addition1
  
  # codecite calc_refactor
  def calc(expr)
    evaluate(parse(expr))
  end
  
  def evaluate(tree)
    case tree.first
    when :num
      tree[1]
    when :+
      left = tree[1]
      right = tree[2]
      evaluate(left) + evaluate(right)
    else
      raise ParseError, "the parser returned an invalid parse tree"
    end
  end
  # codecite calc_refactor
  
  # codecite tree_ops
  def evaluate(tree)
    op = tree.first
    case op
    when :num
      tree[1]
    when :+, :-, :*, :/
      left = tree[1]
      right = tree[2]
      evaluate(left).send(op, evaluate(right))
    else
      raise ParseError, "the parser returned an invalid parse tree"
    end
  end
  # codecite tree_ops
  
  def evaluate(tree)
    op = tree.first
    case op
    when :num
      tree[1]
    # codecite :eval_vars
    when :var
      bindings[tree[1]]
    # codecite :eval_vars
    # codecite tree_exp
    when :"^"
      left = tree[1]
      right = tree[2]
      evaluate(left) ** evaluate(right)
    # codecite tree_exp
    when :+, :-, :*, :/
      left = tree[1]
      right = tree[2]
      evaluate(left).send(op, evaluate(right))
    else
      raise ParseError, "the parser returned an invalid parse tree"
    end
  end
  
  def evaluate(tree)
    op = tree.first
    case op
    when :num
      tree[1]
    # codecite no_such_var
    when :var
      bindings.fetch(tree[1]){ raise ParseError, "unknown variable '#{tree[1]}'"}
    # codecite no_such_var
    when :"^"
      left = tree[1]
      right = tree[2]
      evaluate(left) ** evaluate(right)
    when :+, :-, :*, :/
      left = tree[1]
      right = tree[2]
      evaluate(left).send(op, evaluate(right))
    # codecite eval_assign
    when :"="
      lhs = tree[1]
      rhs = tree[2]
      bindings[lhs] = evaluate(rhs)
    # codecite eval_assign
    else
      raise ParseError, "the parser returned an invalid parse tree"
    end
  end

  # codecite parse_num
  def parse(expr)
    expr =~ /^\s*(\d+)\s*$/
    [:num, Integer($1)]
  end
  # codecite parse_num

  # codecite parse_add
  def parse(expr)
    case expr
    when /^\s*(\d+)\s*$/
      [:num, Integer($1)]
    when /^\s*(\d+)\s*\+\s*(\d+)\s*/
      [:+, parse($1), parse($2)]
    end
  end
  # codecite parse_add

  # codecite parse_error
  def parse(expr)
    case expr
    when /^\s*(\d+)\s*$/
      [:num, Integer($1)]
    when /^\s*(\d+)\s*\+\s*(\d+)\s*/
      [:+, parse($1), parse($2)]
    else
      raise ParseError
    end
  end
  # codecite parse_error

  # codecite parse_ops
  def parse(expr)
    case expr
    when /^\s*(\d+)\s*$/
      [:num, Integer($1)]
    when %r{^\s*(\d+)\s*([-+*/])\s*(\d+)\s*}
      [$2.to_sym, parse($1), parse($3)]
    else
      raise ParseError
    end
  end
  # codecite parse_ops
  
  def parse(expr)
    case expr
    when /^\s*(\d+)\s*$/
      [:num, Integer($1)]
    # codecite parse_var
    when /^\s*([a-zA-Z]\w*)\s*$/
      [:var, $1]
    # codecite parse_var
    # codecite parse_exp
    when %r{^\s*(\d+)\s*([-+*/^])\s*(\d+)\s*}
      [$2.to_sym, parse($1), parse($3)]
    # codecite parse_exp
    else
      raise ParseError
    end
  end
  
  def parse(expr)
    case expr
    when /^\s*(\d+)\s*$/
      [:num, Integer($1)]
    when /^\s*([a-zA-Z]\w*)\s*$/
      [:var, $1]
    # codecite parse_assign
    when /^\s*([a-zA-Z]\w*)\s*=(.*)$/
      [:"=", $1, parse($2)]
    # codecite parse_assign
    # codecite parse_var_exprs
    when %r{^\s*(\w+)\s*([-+*/^])\s*(\w+)\s*}
      [$2.to_sym, parse($1), parse($3)]
    # codecite parse_var_exprs
    else
      raise ParseError
    end
  end
end