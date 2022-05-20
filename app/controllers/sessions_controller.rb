class SessionsController < ApplicationController

    def new
    end
  
    def create
      # Step 1: check to see if there's a user with the email that was provided
      @user = User.find_by({ "email" => params["email"] })
      if @user
        # Step 1a: if yes, check the password (go to Step 2)
        # Step 2: check the password to see if it matches the user's password
        if BCrypt::Password.create(@user["password"]) == params["password"]
          # Step 2a: if yes, go to the companies page
          session["user_id"] = @user["id"]
          flash["notice"] = "You're in!"
          redirect_to "/companies"
        else
          # Step 2b: if no, go back to the login page
          flash["notice"] = "Incorrect credentials"
          redirect_to "/sessions/new"
        end
      else
        # Step 1b: if no, go back to the login page
        flash["notice"] = "Incorrect credentials"
        redirect_to "/sessions/new"
      end
    end

    def destroy
        flash["See ya nerd!"]
        session["user_id"] = nil
        redirect_to "/sessions/new"
    end
  
  end
  