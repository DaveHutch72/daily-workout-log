class UsersController < ApplicationController

    get "/workouts" do
        @workouts = Workout.all
        erb :'workouts/index'
    end

    get "/workouts/:id" do
        @workouts = Workout.find_by(id: params[:id])

        if @workouts
            erb :'workouts/show'
        else
            redirect '/workouts'
        end
    end

end