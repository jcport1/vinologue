class WineController < ApplicationController

get '/wines' do

    @wines = Wine.all
    erb :"wines/index" 

end 

get '/wines/new' do

    if !logged_in? 
        redirect '/login'
    end 

    erb :"wines/new"
end 

get '/wines/:id' do 

    if !logged_in? 
        redirect '/login'
    end

    @wine = Wine.find(params["id"])

    erb :"wines/show"
end

post '/wines' do

    if !logged_in? 
        redirect '/login'
    end

    wine = Wine.new(params)
    wine.user_id = session[:user_id]
    wine.save
    redirect '/wines'
end 



get '/wines/:id/edit' do
    
    @wine = Wine.find(params["id"])
     
    if @wine.user_id != session[:user_id]
        redirect '/wines'
    end

    erb :'wines/edit'
end 

put '/wines/:id' do

    @wine = Wine.find(params["id"])

    if @wine.user_id != session[:user_id]
        redirect '/wines'
    end
    @wine.update(params)
    redirect "/wines/#{@wine.id}"
end 

delete '/wines/:id' do

    @wine = Wine.find(param["id"])

    if @wine.user_id != session[:user_id]
        redirect '/wines'
    end

    @wine.destroy
    redirect '/wines'
end 


end 