class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.column :description, :text
      t.column :poll_id, :integer, :null => false
    end
    execute "alter table questions \
              add constraint fk_question_polls \
              foreign key (poll_id) references polls(id)"
  end

  def self.down
    drop_table :questions
  end
end
