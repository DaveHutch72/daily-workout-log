class WorkoutsController < ApplicationController

    get "/workouts" do
        @workouts = Workout.all
        erb :'workouts/index'
    end

    get "/workouts/new" do
        erb :'workouts/new'
    end

    post "/workouts" do
        
        workout = Workout.new(:name => params[:name], :workout_type => params[:workout_type], :time => params[:time])
        binding.pry
        if workout.save
            redirect "/workouts/#{workout.id}"
        else
            redirect "/workouts/new"
        end
    end

    get "/workouts/:id/edit" do
        
    end

    patch '/posts/:id' do
        binding.pry
    end

    get "/workouts/:id" do
        @workouts = Workout.find_by(id: params[:id])

        if @workouts
            erb :'workouts/show'
        else
            redirect '/workouts'
        end
    end

    get '/account' do
        binding.pry
          @user = User.find_by(id: session[:user_id])
          erb :'workouts/account'
      end

end