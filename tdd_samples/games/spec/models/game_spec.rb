require 'spec_helper'

describe Game do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :min_players => 1,
      :max_players => 1,
      :average_hours => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    Game.create!(@valid_attributes)
  end
  
  # codecite avgscope
  describe "with_average_rating" do
    query_hash = Game.with_average_rating(3).proxy_options
    query_hash[:joins].should == :reviews
    query_hash[:group].should == 'game_id'
    query_hash[:having].should == ['avg(stars) Between ? And ?', 2.5, 3.5]
  end
  # codecite avgscope
  
  describe "#to_s" do
    it "returns the game's name" do
      pit = Game.new(:name => "Pit")
      pit.to_s.should == "Pit"
    end
  end
  
end
