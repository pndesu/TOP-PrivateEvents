class InvitationsController < ApplicationController
        
    def create
        @invitation = Invitation.new(attendee_id: current_user.id, attended_event_id: params[:attended_event_id])

        if @invitation.save
            redirect_to root_path
            flash[:notice] = "Invitation sent!"
        else
            redirect_to root_path
            flash[:alert] = "Invitation failed!"
        end
    end 

    def destroy
        if current_user.invitations.find(params[:id]).destroy
            redirect_to root_path
            flash[:notice] = "You won't go to the party!"
        else
            redirect_to root_path
            flash[:alert] = "Ooops! Something went wrong..."
        end
    end
end
