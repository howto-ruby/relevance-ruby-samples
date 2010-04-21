require 'spec_helper'

describe "/reviews/index.html.erb" do
  include ReviewsHelper

  before(:each) do
    assigns[:reviews] = [
      stub_model(Review,
        :stars => 1,
        :comments => "value for comments",
        :user => 1,
        :game => 1
      ),
      stub_model(Review,
        :stars => 1,
        :comments => "value for comments",
        :user => 1,
        :game => 1
      )
    ]
  end

  it "renders a list of reviews" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for comments".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
