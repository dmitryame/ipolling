class Vote < ActiveRecord::Base
  belongs_to :question
  
  validates_presence_of :question
  validates_inclusion_of :rate, :in => 0..100
end
