require 'spec_helper'

describe Review do
  before(:each) do
    @valid_attributes = {
      :stars => 1,
      :comments => "value for comments",
      :user_id => 1,
      :game_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Review.create!(@valid_attributes)
  end
  
  # codecite star5
  describe "validations" do
    it "rejects a review with less than 0 stars or more than 5" do
      bad_review = Review.new(:stars => -1)
      bad_review.should_not be_valid
      bad_review = Review.new(:stars => 6)
      bad_review.should_not be_valid
    end
    
    it "accepts a review with 0 to 5 stars" do
      (0..5).each do |stars|
        good_review = Review.new(:stars => stars)
        good_review.should be_valid
      end
    end
  end
  # codecite star5
  
end
