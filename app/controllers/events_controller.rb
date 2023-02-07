class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.created_events.build(event_params)
        if @event.save
            redirect_to current_user
            flash[:notice] = "Event created succesfully!"
        else
            render :new, status: unprocessable_entity
        end
    end

    private
    def event_params
        params.require(:event).permit(:name, :date, :location)
    end
end
