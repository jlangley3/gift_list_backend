class ContactSerializer < ActiveModel::Serializer
 attributes :id, :name, :birthday, :avatar, :kind, :created_at, :user_id, :updated_at

 has_many :gifts
 has_many :interests, through: :contact_interests
 has_many :events, through: :gifts

end
