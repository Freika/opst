class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  has_many :matches, dependent: :destroy
  has_many :qualifications, dependent: :destroy
end
