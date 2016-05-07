class ApplicationController < ActionController::Base
    #    prevent someone on the site from creating a profile when they aren't signed up'
    before_action :authenticate_user!, :message_unread_count
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_url, :alert => exception.message
    end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    
    def message_unread_count
        if user_signed_in?
            @mymsgs = Message.messages_to_me(current_user.id).unread.count
        end
    end
    
    
end
