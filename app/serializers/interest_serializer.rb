class InterestSerializer < ActiveModel::Serializer
  attributes :id, :name
  
  has_many :contacts, through: :contact_interests
end
