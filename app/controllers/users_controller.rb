class UsersController < ApplicationController

  get "/" do
    erb :welcome
  end

  get "/signup" do
    erb :'users/signup'
  end

  post "/signup" do
    user = User.new(:username => params[:username], :password => params[:password])
    
    if user.username != "" && user.save
      redirect "/login"
    else
      redirect "/failure"
    end
  end

  get "/login" do
    erb :'users/login'  
  end

  post "/login" do
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/account"
    else
      redirect "/failure"
    end
  end

end