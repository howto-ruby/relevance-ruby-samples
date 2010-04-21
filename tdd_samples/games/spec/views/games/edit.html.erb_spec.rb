require 'spec_helper'

describe "/games/edit.html.erb" do
  include GamesHelper

  before(:each) do
    assigns[:game] = @game = stub_model(Game,
      :new_record? => false,
      :name => "value for name",
      :min_players => 1,
      :max_players => 1,
      :average_hours => 1.5
    )
  end

  it "renders the edit game form" do
    render

    response.should have_tag("form[action=#{game_path(@game)}][method=post]") do
      with_tag('input#game_name[name=?]', "game[name]")
      with_tag('input#game_min_players[name=?]', "game[min_players]")
      with_tag('input#game_max_players[name=?]', "game[max_players]")
      with_tag('input#game_average_hours[name=?]', "game[average_hours]")
    end
  end
end
