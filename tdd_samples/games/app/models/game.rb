class Game < ActiveRecord::Base
  has_many :reviews
  has_many :reviewers, :through => :reviews, :source => :user
  
  # codecite avgscope
  named_scope :with_average_rating, proc { |stars|
    star_num = Integer(stars)
    min = star_num - 0.5
    max = star_num + 0.5
    
    { :joins => :reviews,
      :group => 'game_id', 
      :having => ['avg(stars) Between ? And ?', min, max] 
    }
  }
  # codecite avgscope
  
  def to_s
    name
  end
end
