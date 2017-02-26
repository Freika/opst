module MatchesHelper
  def qualified_and_actual?(qualification)
    qualification.persisted? &&
    qualification.skill_rating
  end
end
