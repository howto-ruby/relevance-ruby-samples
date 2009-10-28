shared_examples_for "an Enumerable" do
  
  describe "#to_a" do
    
    it "returns an array of the elements yielded by each" do
      expected = []
      @enumerable.each{|elem| expected << elem}
      @enumerable.to_a.should == expected
    end
    
  end
  
end
