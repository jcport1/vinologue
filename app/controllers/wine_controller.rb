class WineController < ApplicationController

get '/wines' do

    @users = User.all

    if logged_in? 
        erb :"wines/index"
    else 
        flash[:error] = "Whoops, You Must be Logged in to View This Page"
        redirect '/'
    end 

end 

get '/wines/new' do

    if logged_in?
        @wine_types = WineType.all 
        erb :"wines/new"
    else 
        flash[:error] = "You Must be Logged In to Add New Wine"
        redirect '/'
    end 
end 

get '/wines/:id' do 
    
    @wine = Wine.find(params["id"])
    if logged_in?
        erb :"wines/show"
    else 
        flash[:error] = "Whoops, You Must be Logged in to View This Page"
        redirect '/'
    end 


end

post '/wines' do
    #should authorization be added for this?
    if !logged_in?
        flash[:error] = "Whoops, You Must be Logged in to View This Page"
        redirect '/'
    else
        wine = Wine.new(params)
        wine.user_id = current_user.id #session[:user_id]

            if wine.save #triggers validation 
    
                flash[:message] = "New Wine Added Successfully!"
                redirect "/users/#{current_user.id}"
            else 
            flash[:error] = "Wine Cannot be Added - #{wine.errors.full_messages.to_sentence}"
            redirect "/users/#{current_user.id}"
        end 
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
        redirect "/wines/#{@wine.id}"
    else 
    redirect "/wines/#{@wine.id}"
    end 
end 

get '/search' do 

    @searched_wine = Wine.find_by(name: params[:name])

    if @searched_wine 

     redirect "/wines/#{@searched_wine.id}"
    else 
     flash[:error] = "Wine Not Found"
     redirect "/wines"
    end 
end 

delete '/wines/:id' do

    @wine = Wine.find(params["id"])
    if authorized_to_edit?(@wine)
        @wine.destroy
        flash[:message] = "Wine Deleted Successfully"
        redirect '/wines'
    else
    redirect '/wines'
    end 
end 

# # private 

# # def redirect_if_not_authorized
# #     if @wine.user != current_user
# #         flash[:error] = "You Must Be Logged in to Add a Wine"
# #         redirect '/'
# #     end 
# # end
end 