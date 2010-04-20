class Calculator
  class ParseError < StandardError; end
  
  def calc(expr)
    evaluate(parse(expr))
  end
  
  def evaluate(tree)
    op = tree.first
    case op
    when :num
      tree[1]
    when :"^"
      left = tree[1]
      right = tree[2]
      evaluate(left) ** evaluate(right)
    when :+, :-, :*, :/
      left = tree[1]
      right = tree[2]
      evaluate(left).send(op, evaluate(right))
    else
      raise ParseError, "the parser returned an invalid parse tree"
    end
  end

  def parse(expr)
    case expr
    when /^\s*(\d+)\s*$/
      [:num, Integer($1)]
    when %r{^\s*(\w+)\s*([-+*/^])\s*(\w+)\s*}
      [$2.to_sym, parse($1), parse($3)]
    else
      raise ParseError
    end
  end
end