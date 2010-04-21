require 'spec_helper'

describe "/games/new.html.erb" do
  include GamesHelper

  before(:each) do
    assigns[:game] = stub_model(Game,
      :new_record? => true,
      :name => "value for name",
      :min_players => 1,
      :max_players => 1,
      :average_hours => 1.5
    )
  end

  it "renders new game form" do
    render

    response.should have_tag("form[action=?][method=post]", games_path) do
      with_tag("input#game_name[name=?]", "game[name]")
      with_tag("input#game_min_players[name=?]", "game[min_players]")
      with_tag("input#game_max_players[name=?]", "game[max_players]")
      with_tag("input#game_average_hours[name=?]", "game[average_hours]")
    end
  end
end
