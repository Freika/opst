module MatchesHelper
  def qualified_and_actual?(qualification)
    signed_in? &&
    qualification.persisted? &&
    qualification.skill_rating
  end
end
