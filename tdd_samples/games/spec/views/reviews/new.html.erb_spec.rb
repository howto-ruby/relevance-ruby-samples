require 'spec_helper'

describe "/reviews/new.html.erb" do
  include ReviewsHelper

  before(:each) do
    assigns[:review] = stub_model(Review,
      :new_record? => true,
      :stars => 1,
      :comments => "value for comments",
      :user => 1,
      :game => 1
    )
  end

  it "renders new review form" do
    render

    response.should have_tag("form[action=?][method=post]", reviews_path) do
      with_tag("input#review_stars[name=?]", "review[stars]")
      with_tag("textarea#review_comments[name=?]", "review[comments]")
      with_tag("input#review_user[name=?]", "review[user]")
      with_tag("input#review_game[name=?]", "review[game]")
    end
  end
end
