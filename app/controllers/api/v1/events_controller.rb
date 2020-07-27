class Api::V1::EventsController < ApplicationController
    before_action :get_event, only: [:destroy, :update]
    
    def index
        events = Event.all
        render json: events
    end

    def show
        event = Event.find(params[:id])
        render json: event
    end
    

    def create
      
        event = Event.create(event_params)
  
        render json: event
    end

    def update
   
        @event.update(event_params)
        render json: @event
    end

    def destroy 
        event = @event
        @event.destroy
        render json: event, status: :accepted
    end


    private
    def get_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:id, :title, :start_date, :end_date, :budget, :repeating, :user_id)
    end
end
