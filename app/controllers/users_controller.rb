require 'pry'

class UsersController < ApplicationController

    get "/" do
      erb :welcome
    end
  
    get "/signup" do
      erb :'users/signup'
    end
  
    post "/signup" do
        
      user = User.new(:username => params[:username], :password => params[:password])
        #binding.pry
      if user.username != "" && user.save
        redirect "/login"
      else
        @error = "It looks like you were missing something. Please make sure you have filled out both boxes."
        erb :"users/signup"
      end
    end
end
