class Hero < ApplicationRecord
  include Calculateable

  has_many :chosen_heros, dependent: :destroy
  has_many :matches, through: :chosen_heros
end
