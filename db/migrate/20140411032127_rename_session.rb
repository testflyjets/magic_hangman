class RenameSession < ActiveRecord::Migration
  def up
    rename_table :sessions, :matches
  end

  def down
  end
end
