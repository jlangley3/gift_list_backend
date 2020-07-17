class InterestsController < ApplicationController
  class Api::V1::EventsController < ApplicationController
    def index
        @reminders = Reminder.all
    end
    
      def show
        @reminder = Reminder.find(params[:id])
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
