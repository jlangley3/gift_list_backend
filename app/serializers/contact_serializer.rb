class ContactSerializer < ActiveModel::Serializer
 attributes :id, :name, :birthday, :created_at, :user_id, :updated_at

 has_many :gifts
 has_many :contact_interests
 has_many :interests, through: :contact_interest
 has_many :events, through: :gifts

end
