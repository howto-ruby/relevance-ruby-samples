require 'spec_helper'

describe "/reviews/edit.html.erb" do
  include ReviewsHelper

  before(:each) do
    assigns[:review] = @review = stub_model(Review,
      :new_record? => false,
      :user_id => 1,
      :game_id => 1,
      :stars => 1,
      :comments => "value for comments"
    )
  end

  it "renders the edit review form" do
    render

    response.should have_tag("form[action=#{review_path(@review)}][method=post]") do
      with_tag('input#review_user_id[name=?]', "review[user_id]")
      with_tag('input#review_game_id[name=?]', "review[game_id]")
      with_tag('input#review_stars[name=?]', "review[stars]")
      with_tag('textarea#review_comments[name=?]', "review[comments]")
    end
  end
end
