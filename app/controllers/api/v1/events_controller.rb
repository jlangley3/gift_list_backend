class Api::V1::EventsController < ApplicationController

    
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
        render json: EventSerializer.new(event), status: :accepted
    end

    def update
        @event.update(event_params[:event])
        # @event.requested.update(event_params[:requested_attributes])
        render json: EventSerializer.new(@event)
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
        params.require(:event).permit(:id, :title, :date, :budget)
    end
end
