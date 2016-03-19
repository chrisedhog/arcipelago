class UsersController < ApplicationController
    def make_admin
        @user = User.find(params[:id])
        @user.add_role :admin
        redirect_to :back, alert: 'User is now an admin'
    end
    
    def remove_admin
        @user = User.find(params[:id])
        @user.remove_role :admin
        redirect_to :back, alert: 'Admin privileges removed'
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to :back
    end
    
end

#THis is a comment