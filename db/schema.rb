# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 4) do

  create_table "polls", :force => true do |t|
    t.datetime "created_at"
    t.text     "description"
  end

  add_index "polls", ["created_at"], :name => "index_polls_on_created_at"

  create_table "questions", :force => true do |t|
    t.text    "description"
    t.integer "poll_id",     :null => false
  end

  add_index "questions", ["poll_id"], :name => "fk_question_polls"

  create_table "votes", :force => true do |t|
    t.integer "rate"
    t.integer "question_id", :null => false
  end

  add_index "votes", ["question_id"], :name => "fk_vote_questions"

end
