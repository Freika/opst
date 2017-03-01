namespace :matches do
  desc 'Set number of match for current season'
  task update_number: :environment do
    User.all.each { |user| user.recalculate_matches_numbers }
  end

  desc 'Fix season to current'
  task fix_season: :environment do
    # 1st of March
    matches = Match.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
    matches.update_all(season_id: Season.current.id)
  end
end
