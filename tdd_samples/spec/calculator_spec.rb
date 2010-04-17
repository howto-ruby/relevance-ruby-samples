# codecite outer
require File.dirname(__FILE__) + '/spec_helper'

describe Calculator do
end
# codecite outer

# codecite nested
describe Calculator do
  describe "#parse" do
  end
  
  describe "#evaluate" do
  end
  
  describe "#calc" do
  end
end
# codecite nested

describe Calculator do
  # codecite converted
  describe "#parse" do
    it "parses a simple number" do
      subject.parse("2").should   == [:num, 2]
      subject.parse(" 3 ").should == [:num, 3]
    end
    
    it "parses addition expressions" do
      subject.parse("1+2").should     == [:+, [:num, 1], [:num, 2]]
      subject.parse(" 3 + 4 ").should == [:+, [:num, 3], [:num, 4]]
    end

    it "parses subtraction expressions" do
      subject.parse("1-2").should     == [:-, [:num, 1], [:num, 2]] 
      subject.parse(" 3 - 4 ").should == [:-, [:num, 3], [:num, 4]] 
    end

    it "parses multiplication expressions" do
      subject.parse("1*2").should     == [:*, [:num, 1], [:num, 2]]
      subject.parse(" 3 * 4 ").should == [:*, [:num, 3], [:num, 4]]
    end

    it "parses division expressions" do
      subject.parse("1/2").should     == [:/, [:num, 1], [:num, 2]]
      subject.parse(" 3 / 4 ").should == [:/, [:num, 3], [:num, 4]]
    end

    it "parses exponentiation expressions" do
      subject.parse("1^2").should     == [:"^", [:num, 1], [:num, 2]]
      subject.parse(" 3 ^ 4 ").should == [:"^", [:num, 3], [:num, 4]]
    end
    
    it "raises Calculator::ParseError when an invalid expression is supplied" do
      proc { subject.parse("1a") }.should raise_error(Calculator::ParseError)
    end
    
  end
  
  describe "#evaluate" do
    
    it "returns the number value from a :num tree" do
      subject.evaluate([:num, 2]).should == 2
      subject.evaluate([:num, 3]).should == 3
    end

    it "adds the two operands of a :+ expression" do
      subject.evaluate([:+, [:num, 3], [:num, 2]]).should == 5
      subject.evaluate([:+, [:num, 2], [:num, 1]]).should == 3
    end

    it "subtracts the two operands of a :- expression" do
      subject.evaluate([:-, [:num, 3], [:num, 2]]).should == 1
      subject.evaluate([:-, [:num, 2], [:num, 1]]).should == 1
    end

    it "multiplies the two operands of a :* expression" do
      subject.evaluate([:*, [:num, 3], [:num, 2]]).should == 6
      subject.evaluate([:*, [:num, 3], [:num, 3]]).should == 9
    end

    it "divides the two operands of a :/ expression" do
      subject.evaluate([:/, [:num, 6], [:num, 2]]).should  == 3
      subject.evaluate([:/, [:num, 15], [:num, 3]]).should == 5
    end

    it "applies exponentiation to the two operands of a :^ expression" do
      subject.evaluate([:"^", [:num, 3], [:num, 2]]).should == 9
      subject.evaluate([:"^", [:num, 2], [:num, 3]]).should == 8
    end

    it "raises Calculator::ParseError when given a badly formed tree" do
      proc {subject.evaluate([:foo]) }.should raise_error(Calculator::ParseError)
    end
  end
  
  describe "#calc" do
    
    it "adds two numbers" do
      subject.calc("3+2").should == 5
    end

    it "adds two numbers" do
      subject.calc("3-2").should == 1
    end

    it "adds two numbers" do
      subject.calc("3*2").should == 6
    end

    it "adds two numbers" do
      subject.calc("6/2").should == 3
    end

    it "raises Calculator::ParseError when given an invalid expression" do
      proc { subject.calc("1a") }.should raise_error(Calculator::ParseError)
    end
  end
  # codecite converted
  
end

describe Calculator do
  # codecite bindings
  describe "#bindings" do
    it "starts off with an empty bindings hash" do
      subject.bindings.should == {}
    end
  end
  # codecite bindings
  
  describe "#parse" do
    # codecite parse_var
    it "parses a simple variable reference" do
      subject.parse("x").should == [:var, 'x']
    end
    # codecite parse_var
    
    # codecite parse_var_exprs
    it "parses arithmetic expressions including variables" do
      subject.parse("1+x").should   == [:+, [:num, 1],   [:var, 'x']]
      subject.parse("y * 3").should == [:*, [:var, 'y'], [:num, 3]]
      subject.parse(" x-y ").should == [:-, [:var, 'x'], [:var, 'y']]
    end
    # codecite parse_var_exprs
    
    # codecite parse_assign
    it "parses assignments" do
      subject.parse("x = 3").should     == [:"=", 'x', [:num, 3]]
      subject.parse("y = 2 * 5").should == [:"=", 'y', [:*, [:num, 2], [:num, 5]]]
      subject.parse("z = x").should     == [:"=", 'z', [:var, 'x']]
    end
    # codecite parse_assign
  end
  
  # codecite beforevars
  describe "#evaluate" do
    # a bunch of existing tests omitted here ...
    
    describe "with variables" do
      before do
        subject.bindings['x'] = 3
        subject.bindings['y'] = 2
      end
      # codecite beforevars
      
      # codecite eval_vars
      it "evaluates simple variable reference expressions" do
        subject.evaluate([:var, 'x']).should == 3
      end
      # codecite eval_vars
      
      # codecite no_such_var
      it "raises Calculator::ParseError if an unknown variable is referenced" do
        proc { subject.evaluate([:var, 'z']) }.should raise_error(Calculator::ParseError, "unknown variable 'z'")
      end
      # codecite no_such_var      
      
      # codecite eval_var_exprs
      it "evaluates arithmetic expressions including variables" do
        subject.evaluate([:+, [:num, 1],   [:var, 'x']]).should == 4
        subject.evaluate([:*, [:var, 'y'], [:num, 3]]).should   == 6
        subject.evaluate([:-, [:var, 'x'], [:var, 'y']]).should == 1
      end
      # codecite eval_var_exprs
      
      # codecite eval_assign
      it "evaluates assignments" do
        subject.evaluate([:"=", 'x', [:num, 3]])
        subject.bindings['x'].should == 3
        
        subject.evaluate([:"=", 'y', [:*, [:num, 2], [:num, 5]]])
        subject.bindings['y'].should == 10
        
        subject.evaluate([:"=", 'z', [:var, 'x']])
        subject.bindings['z'].should == 3
      end
      # codecite eval_assign

      # codecite assign_return
      it "returns the result of assignments" do
        subject.evaluate([:"=", 'x', [:num, 3]]).should == 3
      end
      # codecite assign_return
    end
  end
end
