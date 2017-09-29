class AddColumnToLeaderboard < ActiveRecord::Migration[5.1]
  def change
  	add_column :leaderboards, :crikcheck, :boolean ,default: false
  	add_column :leaderboards, :footcheck, :boolean ,default: false
  	add_column :leaderboards, :bollycheck, :boolean ,default: false
  	add_column :leaderboards, :hollycheck, :boolean ,default: false
  end
end
