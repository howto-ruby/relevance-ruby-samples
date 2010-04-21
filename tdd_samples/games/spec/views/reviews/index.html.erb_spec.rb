require 'spec_helper'

describe "/reviews/index.html.erb" do
  include ReviewsHelper

  before(:each) do
    assigns[:reviews] = [
      stub_model(Review,
        :user_id => 1,
        :game_id => 1,
        :stars => 1,
        :comments => "value for comments"
      ),
      stub_model(Review,
        :user_id => 1,
        :game_id => 1,
        :stars => 1,
        :comments => "value for comments"
      )
    ]
  end

  it "renders a list of reviews" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for comments".to_s, 2)
  end
end
