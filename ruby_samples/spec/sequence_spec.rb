# codecite helper
require File.dirname(__FILE__) + '/spec_helper'
# codecite helper

# codecite skeleton
describe Sequence do
  # codecite skeleton
  
  describe "as Enumerable" do
    before do
      @enumerable = Sequence.new(5, 1){|a| a.last + 2}
    end
    
    it_should_behave_like "an Enumerable"
  end
  
  # codecite skeleton
  describe "#generate_next" do
    # codecite skeleton
  
    # codecite generate_next
    it "yields the initial sequence to the block" do
      s = Sequence.new(2, 1, 2) do |a|
        a.should == [1, 2]
      end
      s.generate_next
    end
    # codecite generate_next
  
    # codecite skeleton
  end
  # codecite skeleton
  
  # codecite get_next
  describe "#[]" do
    
    before do
      @s = Sequence.new(4, 1) {|a| 5}
    end
    
    it "returns nil if out of bounds" do
      @s[4].should be_nil
    end
    
    it "generates a new element if needed" do
      @s.should_receive(:generate_next).exactly(3).times.and_return(3, 4, 5)
      @s[1]
      @s[3]
    end
        
    it "returns the next element when one is ready" do
      @s[0].should == 1
      @s[1].should == 5
    end
    
  end
  # codecite get_next
  
  # codecite each
  describe "#each" do
    
    it "should yield each member of the sequence to the block" do
      expected_values = [1, 3, 5]
      s = Sequence.new(3, 1){|a| a.last + 2}
      s.each do |elem|
        expected_values.should_not be_empty
        elem.should == expected_values.shift
      end
    end
    
  end
  # codecite each
  
  describe "complete examples" do
    
    Spec::Matchers.define :produce do |*expected|
      match do |seq|
        seq.to_a == expected
      end
    end
    
    it "can generate even numbers" do
      Sequence.new(5, 2){|a| a.last + 2}.should produce(2,4,6,8,10)
    end
    
    it "can generate odd numbers" do
      Sequence.new(5, 1){|a| a.last + 2}.should produce(1,3,5,7,9)
    end
    
    it "can generate fibonacci numbers" do
      Sequence.new(5, 1, 1){|a| a[-2] + a[-1]}.should produce(1,1,2,3,5)
    end
    
  end
  
  # codecite skeleton
end
# codecite skeleton
