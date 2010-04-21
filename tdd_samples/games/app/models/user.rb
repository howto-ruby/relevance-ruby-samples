class User < ActiveRecord::Base
  has_many :reviews
  has_many :games, :through => :reviews
  
  # codecite agepresent
  validates_presence_of :date_of_birth
  # codecite agepresent
  
  # codecite username
  def to_s
    name
  end
  # codecite username
end
