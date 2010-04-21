require 'spec_helper'

describe Review do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :game_id => 1,
      :stars => 1,
      :comments => "value for comments"
    }
  end

  it "should create a new instance given valid attributes" do
    Review.create!(@valid_attributes)
  end
end
