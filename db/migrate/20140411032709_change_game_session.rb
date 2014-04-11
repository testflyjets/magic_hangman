class ChangeGameSession < ActiveRecord::Migration
  def up
    rename_column :games, :session_id, :match_id
  end

  def down
  end
end
