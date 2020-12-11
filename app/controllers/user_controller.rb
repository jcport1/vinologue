class UserController < ApplicationController
    
    get '/signup' do 

        erb :"users/new"

    end 

    post '/signup' do


        user = User.new(params)

        if user.email.blank? || user.password.blank? || user.user_name.blank? || User.find_by_email(params["email"])

            redirect '/signup'
        else 
            user.save
            session[:user_id] = user.id
            redirect to '/wines'
        end 
    end 

    get '/login' do
    
        erb :"/users/login"

    end 

    post '/login' do

        user = User.find_by(email: params[:email])
    
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id #this actually logsin user
            redirect '/wines'
        else
            # flash[:error] = "Incorrect Credentials"
            redirect '/login'
        end 
    end

    get '/logout' do 
        session.delete(:user_id)
        redirect '/'
    end 
end 