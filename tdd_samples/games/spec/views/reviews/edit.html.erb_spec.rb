require 'spec_helper'

describe "/reviews/edit.html.erb" do
  include ReviewsHelper

  before(:each) do
    assigns[:review] = @review = stub_model(Review,
      :new_record? => false,
      :stars => 1,
      :comments => "value for comments",
      :user => 1,
      :game => 1
    )
  end

  it "renders the edit review form" do
    render

    response.should have_tag("form[action=#{review_path(@review)}][method=post]") do
      with_tag('input#review_stars[name=?]', "review[stars]")
      with_tag('textarea#review_comments[name=?]', "review[comments]")
      with_tag('input#review_user[name=?]', "review[user]")
      with_tag('input#review_game[name=?]', "review[game]")
    end
  end
end
