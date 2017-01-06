namespace :user do
  desc 'Set number of match for current season'
  task create_qualification: :environment do
    User.all.each do |user|
      user.qualifications.create!(season: Season.last)
      p "Qualification for #{user.email} susccessfully created."
    end
  end
end
