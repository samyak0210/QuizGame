json.extract! leaderboard, :id, :user_id, :Cscore, :Fscore, :Bscore, :Hscore, :created_at, :updated_at
json.url leaderboard_url(leaderboard, format: :json)
