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
        binding.pry
      if user.username != "" && user.save
        redirect "/login"
      else
        redirect "/fail_login"
      end
    end
  
    get "/login" do
      erb :'users/login'  
    end
  
    post "/login" do
      user = User.find_by(:username => params[:username])
        #binding.pry
      if user && user.authenticate(params[:password])
        #binding.pry
        session[:user_id] = user.id
        redirect "/account"
      else
        redirect "/fail_login"
      end
    end

    get '/account' do
      binding.pry
        @user = User.find_by(id: session[:user_id])
        erb :'users/account'
    end

    
  
  end
