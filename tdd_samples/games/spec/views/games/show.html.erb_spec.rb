require 'spec_helper'

describe "/games/show.html.erb" do
  include GamesHelper
  before(:each) do
    assigns[:game] = @game = stub_model(Game,
      :name => "value for name",
      :min_players => 1,
      :max_players => 1,
      :average_hours => 1.5
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1\.5/)
  end
end
