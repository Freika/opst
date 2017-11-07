# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  battletag              :string
#

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  has_many :matches, dependent: :destroy
  has_many :qualifications, dependent: :destroy

  after_create :create_qualification

  def recalculate_matches_numbers
    matches.order(created_at: :asc).each.with_index(1) do |match, index|
      match.update!(number: index)
      p "Match ##{match.id} updated."
    end
  end

  private

  def create_qualification
    self.qualifications.create!(season: Season.last)
  end
end
