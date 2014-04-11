class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :user, limit: 20
      t.integer :level
      t.timestamps
    end
  end
end
