class ReviewController < ApplicationController

    get '/reviews' do

        @reviews = Review.all
    
        if logged_in? 
            erb :"reviews/index"
        else 
            flash[:error] = "Whoops, You Must be Logged in to View This Page"
            redirect '/'
        end 
    
    end 
    
    get '/reviews/new' do
    
        if logged_in? 
            erb :"reviews/new"
        else 
            flash[:error] = "You Must be Logged In to Add New Wine"
            redirect '/'
        end 
    end 
    
    get '/reviews/:id' do 
        
        @review = Review.find(params["id"])
        if logged_in?
            erb :"reviews/show"
        else 
            flash[:error] = "Whoops, You Must be Logged in to View This Page"
            redirect '/'
        end 
    
    
    end
    
    post '/reviews' do
        #should authorization be added for this?
        if !not_logged_in?
            flash[:error] = "Whoops, You Must be Logged in to View This Page"
            redirect '/'
        else
            review = Review.new(params)
            review.user_id = current_user.id #session[:user_id]
    
                if review.save #triggers validation 
        
                    flash[:message] = "New Review Added Successfully!"
                    redirect '/reviews'
                else 
                flash[:error] = "Review Cannot be Added - Please Fill Out Required Fields"
                redirect "/reviews/new"
            end 
        end 
    end 
    
    
    
    get '/wines/:id/edit' do
        
        @wine = Wine.find(params["id"])
        # redirect_if_not_authorized 
        if authorized_to_edit?(@review)
            erb :'reviews/edit'
        else 
            flash[:error] = "Not Authorized to Edit"
            redirect "/reviews"
        end 
    end 
    
    put '/reviews/:id' do
    
        @review = Review.find(params["id"])
    
        if authorized_to_edit?(@review)
            @review.update(params["review"])
        else 
        redirect "/reviews/#{@review.id}"
        end 
    end 
    
    delete '/review/:id' do
    
        @review = Review.find(params["id"])
        if authorized_to_edit?(@review)
            @review.destroy
        else
        redirect '/reviews'
        end 
    end 

end 