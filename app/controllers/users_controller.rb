# responsible for anything involving user
# sign up '
# login
# logout 'logout'
class DailyUpdatesController < ApplicationController
   
    # name of class is the model name plus controller
   
    get '/signup' do              #render signup form
        erb :"users/signup"
    end

    post '/signup' do         #process the signup form
    # receive data from the form inside of params hash
    # create new author object with the data
       
    user = User.new(params)
    
    # validate user object 
    # if user.username !=""
    # if user.username.blank?
        if user.username.blank? || user.email.blank? || user.name.blank? || user.password.blank? || User.find_by_email(params[:email]) || User.find_by_username(params[:username])
            redirect '/signup'
        else 
            user.save
            session[:user_id] = user.id #logging user in
            redirect '/posts'
        end
    end
            # if user is valid 
        # persist the new object
        # redirect them
    # else
        # redirect them back to signup page
    # check that user is using unique data

    get '/login' do #render login form 
        erb :"users/login"
    end

    post '/login' do 
        user = User.find_by_username(params[:username])
    end

end