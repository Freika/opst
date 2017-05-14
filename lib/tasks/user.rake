namespace :user do
  desc 'Create qualifications for users in the beginning of season.'
  task create_qualification: :environment do
    User.all.each do |user|
      user.qualifications.create!(season: Season.last)
      p "Qualification for #{user.email} susccessfully created."
    end
  end
end
