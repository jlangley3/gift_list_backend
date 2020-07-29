class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_date, :end_date, :budget, :repeating, :created_at, :user_id, :updated_at, :contacts

  has_many :gifts
  has_many :reminders
  # has_many :contacts, through: :gifts


  def contacts
    custom = []
    contacts = []
    object.contacts.each do |contact|
      custom_contact = contact.attributes
      gifts = contact.gifts.where(:event => object )
      custom_contact[:gifts] = gifts
      contacts << custom_contact
    end
    
    custom << contacts

      return custom
  end
  

end
