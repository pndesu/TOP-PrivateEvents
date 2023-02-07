class InvitationsController < ApplicationController
    def create
        @invitation = Invitation.new(attendee_id: current_user.id, attended_event_id: params[:attended_event_id])

        if @invitation.save
            redirect_to root_path
            flash[:notice] = "Invitation sent!"
        else
            redirect_to current_user
            flash[:alert] = "Invitation failed!"
        end
    end 
end
