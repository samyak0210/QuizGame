class CreateLeaderboards < ActiveRecord::Migration[5.1]
  def change
    create_table :leaderboards do |t|
      t.references :user, foreign_key: true
      t.integer :Cscore, default: 0
      t.integer :Fscore, default: 0
      t.integer :Bscore, default: 0
      t.integer :Hscore, default: 0

      t.timestamps
    end
  end
end
