class EventsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show, :attendees]

    def index

    end

    def show
        @event = Event.find(params[:id])
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

    def attendees
        @event = Event.find(params[:event_id])
    end

    private
    def event_params
        params.require(:event).permit(:name, :date, :location)
    end
end
