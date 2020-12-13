class WineTypeController < ApplicationController

    get '/wine_types' do

        @wine_types = WineType.all
        # @wines = Wine.all 

        # binding.pry 
    
        if logged_in? 
            erb :"wine_types/index"
        else 
            flash[:error] = "Whoops, You Must be Logged in to View This Page"
            redirect '/'
        end 
    
    end 
    
    # get '/wine_types/new' do
    
    #     if logged_in? 
    #         erb :"wine_types/new"
    #     else 
    #         flash[:error] = "You Must be Logged In to Add New Wine"
    #         redirect '/'
    #     end 
    # end 
    
    get '/wine_types/:id' do 
        
        @wine_type = WineType.find(params["id"])
        if logged_in?
            erb :"reviews/show"
        else 
            flash[:error] = "Whoops, You Must be Logged in to View This Page"
            redirect '/'
        end 
    

    end
    
    # post '/wine_types' do
    #     #should authorization be added for this?
    #     # if !not_logged_in?
    #     #     flash[:error] = "Whoops, You Must be Logged in to View This Page"
    #     #     redirect '/'
    #     # else
    #         wine_type = WineType.new(params)
    #         wine_type.user_id = current_user.id #session[:user_id]
    
    #             if wine_type.save #triggers validation 
        
    #                 flash[:message] = "New Wine Type Added Successfully!"
    #                 redirect "/users/#{current_user.id}"
    #             else 
    #             flash[:error] = "Wine Type Cannot be Added - Please Fill Out Required Fields"
    #             redirect "/wine_types/new"
    #        end 
    # end 
    
    
    
    # get '/reviews/:id/edit' do
        
    #     @review = Review.find(params["id"])
    #     # redirect_if_not_authorized 
    #     if authorized_to_edit?(@review)
    #         erb :'reviews/edit'
    #     else 
    #         flash[:error] = "Not Authorized to Edit"
    #         redirect "/reviews"
    #     end 
    # end 
    
    # put '/reviews/:id' do
    
    #     @review = Review.find(params["id"])
    
    #     if authorized_to_edit?(@review)
    #         @review.update(params["review"])
    #     else 
    #     redirect "/reviews/#{@review.id}"
    #     end 
    # end 
    
    # delete '/review/:id' do
    
    #     @review = Review.find(params["id"])
    #     if authorized_to_edit?(@review)
    #         @review.destroy
    #     else
    #     redirect '/reviews'
    #     end 
    # end 

end 