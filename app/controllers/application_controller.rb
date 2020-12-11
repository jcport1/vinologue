require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_session" #enables sessions(hash)
    register Sinatra::Flash

  end

  get "/" do
    if logged_in?
      redirect to '/wines'
    else 
    erb :index
    end 
  end

  helpers do
    
    #authorization
    def logged_in?
      !!current_user
    end 

    #keeps track of logged in user
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 
  end

  private 
  def redirect_if_not_logged_in
    if !logged_in? 
        redirect '/login' 
    end
end 
end
