class SessionsController < ApplicationController
    get "/login" do
        erb :'sessions/login'  
    end
    
    post "/login" do
        user = User.find_by(username: params[:username])
          #binding.pry
        if user && user.authenticate(params[:password])
          #binding.pry
          session[:user_id] = user.id
          redirect "/workouts"
        else
          redirect "/fail_login"
        end
    end
  
    get "/logout" do
        session.clear
        redirect "/login"
    end
end