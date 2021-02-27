# responsible for anything involving user
# sign up '
# login
# logout 'logout'
class UsersController < ApplicationController
   
    # name of class is the model name plus controller
   
    get '/signup' do             #render signup form
        if logged_in?
            redirect 'daily_updates'
        else
            erb :"users/signup"
        end
    end

    post '/signup' do         #process the signup form
    # receive data from the form inside of params hash
    # create new author object with the data
    user = User.new(params)
    # validate user object 
    # if user.username !=""
    # if user.username.blank?
        if user.username.blank? || user.email.blank? || user.name.blank? || user.password.blank? 
            flash[:error] = "Enter valid data in the signup form. Do not leave any fields blank."
            redirect '/signup'
        elsif User.find_by_email(params[:email]) || User.find_by_username(params[:username])
            flash[:error] = "An account with this email or username already exists. Create a new account or login."
            redirect '/signup'
        else 
            user.save
            session[:user_id] = user.id #logging user in
            redirect '/daily_updates/new' 
        end
    end
            # if user is valid 
        # persist the new object
        # redirect them
    # else
        # redirect them back to signup page
    # check that user is using unique data

    get '/login' do #render login form 
        if logged_in?
            redirect '/daily_updates'
        else
            erb :"users/login"
        end
    end

    post '/login' do 
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "daily_updates/new" #This is in daily_updates_controller
            # another option is redirect "daily_updates"
        else
         flash[:error] = "Incorrect login. Enter the correct username and password."
            redirect '/login'
        end
    end


    get '/logout' do
        session.clear
       redirect '/login'
    end



end

#  .find can return an error
#  .find_by_<attr> will return nil if data does not exit