class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def attended_events
        @user = User.find(params[:user_id])
    end

    def created_events
        @user = User.find(params[:user_id])
    end

    def invited_events
        @user = User.find(params[:user_id])
    end

    def view_user_list
        
    end

    def invite_users
        
    end
end
