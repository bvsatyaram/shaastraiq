class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.text :content

      t.belongs_to :quiz
    end
  end

  def self.down
    drop_table :questions
  end
end
