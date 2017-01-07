class MatchesRecalculatorWorker
  include Sidekiq::Worker
  def perform(user_id)
    user = User.find(user_id)
    user.recalculate_matches_numbers
  end
end
