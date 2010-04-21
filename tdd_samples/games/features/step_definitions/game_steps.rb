# codecite exists
Given /^a game exists called "([^\"]*)"$/ do |name|
  @game = Game.new(:name => name)
end
# codecite exists

# codecite mockrating
Given /^the game has a rating close to (\d)$/ do |stars|
  Game.stubs(:with_average_rating).with(stars.to_i).returns(stub(:all => [@game]))
end
# codecite mockrating
