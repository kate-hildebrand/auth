class ApplicationController < ActionController::Base
# we want to copy the session cookie for the user into all the application 
    before_action :set_current_user

    def set_current_user
        @current_user = User.find_by({ "id" => session["user_id"]})
    end
end
