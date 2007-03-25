class Poll < ActiveRecord::Base
  has_many :questions
  
  validates_presence_of :description
  
end
