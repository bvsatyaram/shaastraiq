class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :content
      t.boolean :correct, :default => false
      t.belongs_to :question
    end
  end

  def self.down
    drop_table :answers
  end
end
