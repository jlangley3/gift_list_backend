class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :budget

  has_many :gifts
  has_many :reminders
  has_many :contacts
end
