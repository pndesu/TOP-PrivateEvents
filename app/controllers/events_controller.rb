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

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
            redirect_to @event
            flash[:notice] = "Event updated!"
        else
            render :edit, status: unprocessable_entity
            flash[:alert] = "Ooops! Something went wrong..."
        end
    end

    def destroy
        @event = Event.find(params[:id])
        if @event.destroy
            redirect_to user_path(current_user)
            flash[:notice] = "Event #{@event.name} deleted!"
        else
            redirect_to user_path(current_user), status: unprocessable_entity
            flash[:alert] = "Ooops! Something went wrong..."
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
