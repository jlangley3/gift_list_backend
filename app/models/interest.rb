class Interest < ApplicationRecord
    has_many :contact_interests, dependent: :destroy
    has_many :contacts, through: :contact_interests
end
