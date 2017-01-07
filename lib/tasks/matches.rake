namespace :matches do
  desc 'Set number of match for current season'
  task update_number: :environment do
    User.all.each { |user| user.recalculate_matches_numbers }
  end
end
