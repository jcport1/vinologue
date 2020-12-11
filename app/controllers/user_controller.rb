class UserController < ApplicationController
    
    get '/signup' do

        erb :'users/new'

    end 

    post '/signup' do


        user = User.new(params)

        if user.save 
            session[:user_id] = user.id
            flash[:message] = "Signup was Succesful!"
            redirect to '/wines'
        else 
            flash[:error] = "Signup was Not Successful - Try Again!"
            redirect '/signup'
        end 
    end 

    get '/login' do
    
        erb :'/users/login'

    end 

    post '/login' do

        user = User.find_by(email: params[:email])
    
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id #this actually logsin user
            flash[:message] = "Welcome, #{user.user_name}"
            redirect '/wines'
        else
            flash[:error] = "Invalid Credentials - Try again"
            redirect '/login'
        end 
    end

    get '/logout' do 
        session.delete(:user_id)
        redirect '/'
    end 
end 