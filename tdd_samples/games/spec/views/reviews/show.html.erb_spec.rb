require 'spec_helper'

describe "/reviews/show.html.erb" do
  include ReviewsHelper
  before(:each) do
    assigns[:review] = @review = stub_model(Review,
      :stars => 1,
      :comments => "value for comments",
      :user => 1,
      :game => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ comments/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
