class GiftSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :given, :rating, :link, :event_id, :contact_id
end
