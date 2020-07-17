class User < ApplicationRecord
    has_secure_password

    has_many :events

    validates :username, uniqueness: { case_sensitive: false }
    

    def name
      "#{self.first_name} #{self.last_name}"
    end
end
