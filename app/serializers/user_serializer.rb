class UserSerializer < ActiveModel::Serializer
  attributes :username, :first_name, :last_name, :avatar, :id
  
  has_many :events
  has_many :contacts
  has_many :reminders, through: :events
  has_many :gifts, through: :events
end