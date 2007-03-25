require 'active_record/fixtures'

class LoadDevData < ActiveRecord::Migration
  def self.up
    down
    
    directory = File.join(File.dirname(__FILE__), "dev_data")
    Fixtures.create_fixtures(directory, "polls")
    Fixtures.create_fixtures(directory, "questions")
    Fixtures.create_fixtures(directory, "votes")
  end

  def self.down
    Vote.delete_all
    Question.delete_all
    Poll.delete_all
  end
end
