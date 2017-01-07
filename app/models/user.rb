class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  has_many :matches, dependent: :destroy
  has_many :qualifications, dependent: :destroy

  def recalculate_matches_numbers
    matches.order(created_at: :asc).each.with_index(1) do |match, index|
      match.update!(number: index)
      p "Match ##{match.id} updated."
    end
  end
end
