class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def attended_events
        @user = User.find(params[:user_id])
    end
end
