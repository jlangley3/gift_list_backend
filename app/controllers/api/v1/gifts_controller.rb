class GiftsController < ApplicationController
  class Api::V1::EventsController < ApplicationController
      def index
          contacts = Contact.all
          render json: ContactSerializer.new(contacts)
      end

      def show
          contact = Contact.find(params[:id])
          render json: ContactSerializer.new(contact)
      end


      def create
          contact = Contact.create(contact_params)
          render json: ContactSerializer.new(contact), status: :accepted
      end
      def new
        @reminder = Reminder.new
        3.times {@Reminder.snacks.build}
      end
    
      def create
        @reminder = Reminder.create(Reminder_params)
        
      end
    
      private
    
      def strong_params
        params.require(:Reminder).permit(:name, :year_established, 
            snacks_attributes: [:name, :calories, :deliciousness])
      end
end
