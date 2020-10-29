class WorkoutsController < ApplicationController

    get "/workouts" do
        if logged_in?
            @workouts = current_user.workouts
            erb :'workouts/index'
        else
            redirect '/login'
        end
    end

    get "/workouts/new" do
        if logged_in?
            erb :'workouts/new'
        else
            redirect '/login'
        end    
    end

    post "/workouts" do
        
        workout = current_user.workouts.build(params)
        binding.pry
        if workout.save
            redirect "/workouts/#{workout.id}"
        else
            redirect "/workouts/new"
        end
    end

    get "/workouts/:id/edit" do
        if logged_in?
            @workout = current_user.workouts.find_by(params)
            if @workout
                erb :'workouts/edit'
            else
                redirect '/workouts'
            end
        else
            redirect '/login'
        end
           
    end

    patch '/posts/:id' do
        workout = current_user.workouts.find_by(id: params[:id])
        if workout
            if workout.update(name: params[:name], workout_type: params[:workout_type], time: params[:time])
                redirect "/workouts/#{workout.id}"
            else
                redirect "/workouts"
            end
        else
            redirect '/workouts'
        end
    end

    get "/workouts/:id" do
        if logged_in?
            @workout = current_user.workouts.find_by(id: params[:id])

            if @workouts
                erb :'workouts/show'
            else
                redirect '/workouts'
            end
        else
        end
    end

    get '/account' do
          @user = User.find_by(id: session[:user_id])
          erb :'workouts/account'
    end

    delete '/workouts/:id' do
        if logged_in?
            @workouts = Workout.find_by(id: params[:id])
            if @post
                @post.destroy
            end
            redirect '/workouts'
        else
            redirect '/login'
        end
    end

end