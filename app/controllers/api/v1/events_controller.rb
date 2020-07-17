class Api::V1::EventsController < ApplicationController
    def index
        
        render json: Event.all.as_json(:include => [:user])
    end

    def show 
        event = Event.find_by(id: params[:id])
        render json: event.as_json(:include => [:user])
    end
end
