class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word, limit: 12
      t.string :category, limit: 12

      t.timestamps
    end
  end
end
