namespace :matches do
  desc 'Set number of match for current season'
  task update_number: :environment do
    User.all.each do |user|
      user.matches.order(created_at: :asc).each.with_index(1) do |match, index|
        match.update!(number: index)
      end
    end
  end
end
