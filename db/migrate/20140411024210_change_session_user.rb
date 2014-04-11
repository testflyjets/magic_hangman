class ChangeSessionUser < ActiveRecord::Migration
  def up
    rename_column :sessions, :user, :player
  end

  def down
    rename_column :sessions, :player, :user
  end
end
