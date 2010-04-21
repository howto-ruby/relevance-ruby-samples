require 'spec_helper'

describe "/games/index.html.erb" do
  include GamesHelper

  before(:each) do
    assigns[:games] = [
      stub_model(Game,
        :name => "value for name",
        :min_players => 1,
        :max_players => 1,
        :average_hours => 1.5
      ),
      stub_model(Game,
        :name => "value for name",
        :min_players => 1,
        :max_players => 1,
        :average_hours => 1.5
      )
    ]
  end

  it "renders a list of games" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
  end
end
