class WineController < ApplicationController

get '/wines' do

    @wines = Wine.all
    erb :"wines/index" 

end 

get '/wines/new' do

    if logged_in? 
        erb :"wines/new"
    else 
        flash[:error] = "You Must be Logged In to Add New Wine"
        redirect '/'
    end 
end 

get '/wines/:id' do 
    
#    redirect_if_not_logged_in 
    @wine = Wine.find(params["id"])
        erb :"wines/show"
end

post '/wines' do

    #if valid 
    # redirect_if_not_logged_in 
    wine = Wine.new(params)
    wine.user_id = current_user.id #session[:user_id]
    if wine.save #triggers validation 
    
        flash[:message] = "New Wine Added Successfully!"
        redirect '/wines'
    else 
        flash[:error] = "Wine Cannot be Added - Please Fill Out Required Fields"
        redirect "/wines/new"
    end 
end 



get '/wines/:id/edit' do
    
    @wine = Wine.find(params["id"])
    # redirect_if_not_authorized 
    if authorized_to_edit?(@wine)
        erb :'wines/edit'
    else 
        flash[:error] = "Not Authorized to Edit"
        redirect "/wines"
    end 
end 

put '/wines/:id' do

    @wine = Wine.find(params["id"])

    if authorized_to_edit?(@wine)
        @wine.update(params["wine"])
    else 
    redirect "/wines/#{@wine.id}"
    end 
end 

delete '/wines/:id' do

    @wine = Wine.find(params["id"])
    if authorized_to_edit?(@wine)
        @wine.destroy
    else
    redirect '/wines'
    end 
end 

# private 

# def redirect_if_not_authorized
#     if @wine.user != current_user
#         flash[:error] = "You Must Be Logged in to Add a Wine"
#         redirect '/'
#     end 
# end
end 