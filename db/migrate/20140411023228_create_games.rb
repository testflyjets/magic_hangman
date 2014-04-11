class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :session_id
      t.integer :word_id
      t.integer :guesses, default: 0
      t.boolean :win, default: false
      t.timestamps
    end
  end
end
