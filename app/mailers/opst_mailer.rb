class OpstMailer < ApplicationMailer
  def closing(user)
    @user = user

    matches = @user.matches.includes(:map, :heros).order(created_at: :desc)
    @file = "#{@user.email}_stats.csv"

    exported_stats = matches.to_csv

    attachments[@file] = {mime_type: 'text/csv', content: exported_stats}

    mail(to: @user.email, subject: "OPST is closing")
  end
end
