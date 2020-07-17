class ReminderSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_date, :end_date, :repeating, :event_id
end
