class UsersController < ApplicationController
    require 'pry'
  get "/" do
    erb :welcome
  end

  get "/signup" do
    erb :'users/signup'
  end

  post "/signup" do
    binding.pry
    user = User.new(:username => params[:username], :password => params[:password])
    
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
    binding.pry
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/account"
    else
      redirect "/fail_login"
    end
  end

  get "/fail_login" do
    erb :'users/fail_login'
  end

end