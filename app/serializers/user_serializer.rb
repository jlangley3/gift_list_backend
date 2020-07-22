class UserSerializer < ActiveModel::Serializer
  attributes :username, :first_name, :last_name, :avatar, :id, :events
  
  # has_many :events
  has_many :contacts
  has_many :reminders, through: :events
  has_many :gifts, through: :events

    def events
      custom = []
      contacts = {}
      object.events.each do |event|
        custom_event = event.attributes 
        contacts = event.contacts
 
        gifts = []
        event.gifts.each do |gift|
          custom_gift = gift.attributes
          custom_gift[:contact] = gift.contact
          gifts << custom_gift
        end

        custom_event[:gifts] = gifts
        custom_event[:contacts] = contacts
        custom << custom_event
      end
      return custom
    end

end