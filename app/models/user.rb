class User < ApplicationRecord
    has_secure_password
    has_many :events, dependent: :destroy
    has_many :contacts, dependent: :destroy
    has_many :reminders, through: :events
    has_many :gifts, through: :events
    validates :username, uniqueness: { case_sensitive: false }
    

    def name
      "#{self.first_name} #{self.last_name}"
    end
end
