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
  
  # codecite mockparse
  describe "#calc" do
    describe "with valid input" do
      
      it "calls #parse with the passed expression" do
        subject.expects(:parse).with("some expr")
        subject.stubs(:evaluate)
        subject.calc("some expr")
      end
    end
  end
  # codecite mockparse
     
  describe "#calc" do 
    describe "with valid input" do
      # codecite mockevaluate
      it "calls #evaluate with the result of parse" do
        subject.stubs(:parse).returns("some tree")
        subject.expects(:evaluate).with("some tree")
        subject.calc(:whatever)
      end
      # codecite mockevaluate
      
      # codecite mockresult
      it "returns the result of #evaluate" do
        subject.stubs(:parse)
        subject.stubs(:evaluate).returns("some result")
        subject.calc(:whatever).should == "some result"
      end
      # codecite mockresult
    end
    
    # codecite mockerrorparse
    describe "error handling" do
      
      it "allows an exception raised by #parse to continue" do
        subject.stubs(:parse).raises(Calculator::ParseError)
        proc { subject.calc(:whatever) }.should raise_error(Calculator::ParseError)
      end
    end
    # codecite mockerrorparse
      
    describe "error handling" do
      # codecite mockerrorevaluate
      it "allows an exception raised by #evaluate to continue" do
        subject.stubs(:parse)
        subject.stubs(:evaluate).raises(Calculator::ParseError)
        proc { subject.calc(:whatever) }.should raise_error(Calculator::ParseError)
      end
      # codecite mockerrorevaluate
    end
  end
  
  # codecite mock_in_out
  describe "#instream" do
    it "returns $stdin by default" do
      subject.instream.should == $stdin
    end
    
    it "can be set by #instream=" do
      subject.instream = :some_stream
      subject.instream.should == :some_stream
    end
  end
  
  describe "#outstream" do
    it "returns $stdout by default" do
      subject.outstream.should == $stdout
    end
    
    it "can be set by #outstream=" do
      subject.outstream = :some_stream
      subject.outstream.should == :some_stream
    end
  end
  
  describe "user interface" do
    before do
      subject.stubs(:instream).returns(stub_everything)
      subject.stubs(:outstream).returns(stub_everything)
    end
  end
  # codecite mock_in_out
      
  describe "user interface" do
    before do
      subject.stubs(:instream).returns(stub_everything)
      subject.stubs(:outstream).returns(stub_everything)
    end
    
    # codecite prompt_read
    describe "#prompt_and_read" do
    
      it "issues the prompt to outstream and reads a single-line expression from instream" do
        prompt_and_read = sequence('prompt and read')
      
        subject.outstream.expects(:write).with("expr> ").in_sequence(prompt_and_read)
        subject.instream.expects(:gets).returns("some expr\n").in_sequence(prompt_and_read)
      
        subject.prompt_and_read.should == "some expr"
      end
    end
    # codecite prompt_read

    # codecite read_respond
    describe "#read_and_respond" do
      it "reads an expression and prints the result" do
        subject.expects(:prompt_and_read).returns("some expr")
        subject.expects(:calc).with("some expr").returns("a result")
        subject.outstream.expects(:puts).with("=> a result")
        
        subject.read_and_respond
      end
    end
    # codecite read_respond
    
    # codecite ui_loop
    describe "#ui_loop" do
      it "calls #read_and_respond forever" do
        subject.expects(:loop).multiple_yields([], [])
        subject.expects(:read_and_respond).twice
        subject.ui_loop
      end
    end
    # codecite ui_loop
    
    describe "#read_and_respond" do
      # codecite rescue
      it "prints 'Invalid expression' in response to a ParseError" do
        subject.stubs(:prompt_and_read).returns("some expr")
        subject.expects(:calc).with("some expr").raises(Calculator::ParseError)
        subject.outstream.expects(:puts).with("Invalid expression")
        
        subject.read_and_respond
      end
      # codecite rescue    
    end
    
    # codecite eof
    describe "#prompt_and_read" do
      it "throws :eof when gets returns nil" do
        subject.instream.stubs(:gets).returns(nil)
        proc { subject.prompt_and_read }.should throw_symbol(:eof)
      end
    end
    
    describe "#ui_loop" do
      it "quits when :eof is thrown" do
        two_exprs = sequence("two exprs")
        subject.instream.expects(:gets).returns("1+1").twice.in_sequence(two_exprs)
        subject.instream.expects(:gets).returns(nil).in_sequence(two_exprs)
        subject.expects(:calc).with("1+1").returns(2).twice
        subject.outstream.expects(:puts).with().in_sequence(two_exprs)
        
        subject.ui_loop
      end
    end
    # codecite eof
  end
  
end
