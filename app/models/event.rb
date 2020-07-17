class Event < ApplicationRecord
    belongs_to :user
    has_many :gifts, dependent: :destroy
    has_many :reminders, dependent: :destroy
    has_many :contacts, through: :gifts

end
