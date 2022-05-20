class SessionsController < ApplicationController

    def new
    end

    def create
        # step 1: check to see if if there's a user with email that was provided 
        @user = User.find_by ({ "email" => params["email"]})
        if @user 
        # a if yes, check pw (go to step 2)        
        # 2 check the pw to see if it matches
        if params["password"] == @user["password"]
        # if yes, proceed to page 
            redirect_to "/companies"
        else
            # if no, back to login page 
            redirect_to "/sessions/new"
        end
    else
        # Step 1b: if no, go back to the login page
        flash["notice"] = "Incorrect credentials"
        redirect_to "/sessions/new"
    end 
    end
end