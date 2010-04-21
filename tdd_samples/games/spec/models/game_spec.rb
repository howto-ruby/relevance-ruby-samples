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
end
