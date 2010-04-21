class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  
  # codecite star5
  validates_inclusion_of :stars, :in => 0..5
  # codecite star5
end
