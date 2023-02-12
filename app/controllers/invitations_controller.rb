class InvitationsController < ApplicationController
        
    def create
        @invitation = Invitation.new(attendee_id: params[:attendee_id], attended_event_id: params[:attended_event_id], requested: params[:requested], accepted: params[:accepted])

        if @invitation.save
            redirect_back(fallback_location: root_path)
            flash[:notice] = "Invitation sent!"
        else
            redirect_back(fallback_location: root_path)
            flash[:alert] = "Invitation failed!"
        end
    end 

    def destroy
        invitation = current_user.invitations.find(params[:id])
        if invitation.destroy
            redirect_back(fallback_location: root_path)
            flash[:notice] = "You won't go to the party #{invitation.attended_event.name}!"
        else
            redirect_back(fallback_location: root_path) 
            flash[:alert] = "Ooops! Something went wrong..."
        end
    end
end