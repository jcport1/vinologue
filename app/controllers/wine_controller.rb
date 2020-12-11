class WineController < ApplicationController

get '/wines' do

    @wines = Wine.all
    erb :"wines/index" 

end 

get '/wines/new' do

    redirect_if_not_logged_in
    erb :"wines/new"
end 

get '/wines/:id' do 

   redirect_if_not_logged_in 
    @wine = Wine.find(params["id"])
    erb :"wines/show"
end

post '/wines' do

    redirect_if_not_logged_in 
    wine = Wine.new(params)
    wine.user_id = session[:user_id]
    wine.save
    redirect '/wines'
end 



get '/wines/:id/edit' do
    
    @wine = Wine.find(params["id"])
    redirect_if_not_authorized 
    erb :'wines/edit'
end 

put '/wines/:id' do

    @wine = Wine.find(params["id"])
    redirect_if_not_authorized
    @wine.update(params["wine"])
    redirect "/wines/#{@wine.id}"
end 

delete '/wines/:id' do

    @wine = Wine.find(param["id"])
    redirect_if_not_authorized
    @wine.destroy
    redirect '/wines'
end 

private 

def redirect_if_not_authorized
    if @wine.user != current_user
        redirect to '/wines'
    end 
end
end 