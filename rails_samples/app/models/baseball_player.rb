class BaseballPlayer < ActiveRecord::Base
  named_scope :slugger, :conditions => ['batting_average > ?', 0.400]
  named_scope :rookie, lambda { { :conditions => ['created_at > ?', 1.year.ago] } }
end
