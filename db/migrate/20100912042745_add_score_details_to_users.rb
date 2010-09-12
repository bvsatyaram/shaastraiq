class AddScoreDetailsToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :correct_answers_count
      t.integer :wrong_answers_count
      t.integer :score
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :start_time, :end_time, :correct_answers_count, :wrong_answers_count, :score
    end
  end
end
