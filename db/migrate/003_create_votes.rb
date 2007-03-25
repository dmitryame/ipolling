class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.column :rate, :integer
      t.column :question_id, :integer, :null => false
    end
    execute "alter table votes \
              add constraint fk_vote_questions \
              foreign key (question_id) references questions(id)"
  end

  def self.down
    drop_table :votes
  end
end
