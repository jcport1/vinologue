class UserController < ApplicationController
    

get '/signup' do 

    erb :"users/new"

end 

post '/signup' do

    u = User.new(params)

    if u.email.blank? || u.password.blank? || User.find_by_email(params["email"])

        redirect '/signup'
    else 
        u.save
        session[:user_id] = u.user_id
        redirect to '/wines'

end 

get '/login' do
    
    erb :"/users/login"

end 

post '/login' do

    u = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/wines'
    else
        redirect '/login'
    end 
end

get '/logout' do 
    session.delete(:user_id)
    redirect '/'
end 

end 