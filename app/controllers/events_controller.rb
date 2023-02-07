class EventsController < ApplicationController
    def index
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.build_event(event_params)
        if @event.save
            redirect_to user_path
            flash[:notice] = "Event created succesfully!"
        else
            render :new, status: unprocessable_entity
        end
    end

    private
    def event_params
        params.require(:event).permit(:date, :location)
    end
end
