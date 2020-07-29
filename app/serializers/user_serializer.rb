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
        
        cons =[]
        contacts.each do |contact|
          custom_contact = contact.attributes
          gifts = contact.gifts.where(:event => event )
                custom_contact[:gifts] = gifts

            cons << custom_contact
        end
        
        gifts = []
        event.gifts.each do |gift|
          custom_gift = gift.attributes
          custom_gift[:contact] = gift.contact
          gifts << custom_gift
        end

        custom_event[:gifts] = gifts
        custom_event[:contacts] = cons
        custom << custom_event
      end
      return custom
    end


    def contacts
      custom = []
      
      object.contacts.each do |contact|
        custom_contact = contact.attributes 
        interests = contact.interests 
        gifts = contact.gifts
        custom_contact[:interests] = interests
        custom_contact[:gifts] = gifts
        custom << custom_contact
      end
      return custom
    end

end




# def events
#   custom = []
#   contacts = {}
#   object.events.each do |event|
#     custom_event = event.attributes 
#     contacts = event.contacts

#     gifts = []
#     event.gifts.each do |gift|
#       custom_gift = gift.attributes
#       custom_gift[:contact] = gift.contact
#       gifts << custom_gift
#     end

#     custom_event[:gifts] = gifts
#     custom_event[:contacts] = contacts
#     custom << custom_event
#   end
#   return custom
# end







# new_contacts = []
# object.events.each do |event|
#   contacts = []
#   custom_event = event.attributes 
#   contacts = event.contacts
#    contacts.each do |contact|
#     custom_contact = contact.attributes
#      custom_contact[:gifts] = contact.gifts
#       custom_contact[:contact] = custom_contact
#          new_contacts << custom_contact
#    end