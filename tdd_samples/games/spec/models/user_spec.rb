require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :date_of_birth => 18.years.ago
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
  
  # codecite username
  describe "#to_s" do
    it "returns the user's name" do
      joe = User.new(:name => "Joe")
      joe.to_s.should == "Joe"
    end
  end
  # codecite username

  # codecite agepresent
  describe "validations" do
    it "rejects a user without an age" do
      youngster = User.new(:name => "Billy", :date_of_birth => nil)
      youngster.should_not be_valid
    end
    
    it "accepts a user with a birth date" do
      acceptable_user = User.new(:name => "Joe", :date_of_birth => 12.years.ago)
      acceptable_user.should be_valid
    end
  end
  # codecite agepresent
  
end
