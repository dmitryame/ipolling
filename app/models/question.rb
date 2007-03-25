class Question < ActiveRecord::Base
  belongs_to :poll
  has_many :votes

  validates_presence_of :poll, :description
  validates_uniqueness_of :description, :scope => [:poll_id]
  
  # calculated field is not stored in the DB
  def rating
    return votes.average(:rate) if(votes.size > 0) # example of duck typing here -- very convinient       
    "Not Rated" 
  end
end
