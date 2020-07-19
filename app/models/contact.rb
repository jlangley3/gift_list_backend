class Contact < ApplicationRecord
  belongs_to :user
  has_many :gifts, dependent: :destroy
  has_many :contact_interests, dependent: :destroy
  has_many :interests, through: :contact_interests
  has_many :events, through: :gifts
end
