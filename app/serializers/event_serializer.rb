class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_date, :end_date, :budget, :repeating, :created_at, :user_id, :updated_at

  has_many :gifts
  has_many :reminders
  has_many :contacts, through: :gifts
end
