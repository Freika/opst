module MatchesHelper
  def qualified_and_actual?(qualification)
    signed_in? &&
    qualification.persisted? &&
    qualification.skill_rating
  end

  def match_date(user, match)
    today = match.created_at.beginning_of_day..match.created_at.end_of_day

    if user.matches.where(created_at: today).last ==  match
      match.created_at.strftime('%d %b')
    end
  end
end
