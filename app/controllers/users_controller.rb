class UsersController < ApplicationController

get "/" do
    erb :welcome
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    user = User.new(:username => params[:username], :password => params[:password])
    
    if user.username != "" && user.save
      redirect "/login"
    else
      redirect "/failure"
    end
  end