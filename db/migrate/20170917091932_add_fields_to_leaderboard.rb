class AddFieldsToLeaderboard < ActiveRecord::Migration[5.1]
  def change
    add_column :leaderboards, :maxc, :integer, default: 0
    add_column :leaderboards, :maxf, :integer, default: 0
    add_column :leaderboards, :maxb, :integer, default: 0
    add_column :leaderboards, :maxh, :integer, default: 0
    add_column :leaderboards, :curc, :integer, default: 0
    add_column :leaderboards, :curf, :integer, default: 0
    add_column :leaderboards, :curb, :integer, default: 0
    add_column :leaderboards, :curh, :integer, default: 0
  end
end
