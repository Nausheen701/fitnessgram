# responsible for anything involving user
# sign up '
# login
# logout 'logout'
class UsersController < ApplicationController
   
    # name of class is the model name plus controller
   
    get '/signup' do              #render signup form
        erb :"users/signup"
    end

    post '/signup' do         #process the signup form
    # receive data from the form inside of params hash
    # create new author object with the data
    #    binding.pry
    user = User.new(params)
    
    # validate user object 
    # if user.username !=""
    # if user.username.blank?
        if user.username.blank? || user.email.blank? || user.name.blank? || user.password.blank? || User.find_by_email(params[:email]) || User.find_by_username(params[:username])
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
        erb :"users/login"
    end

    post '/login' do 
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            erb :"daily_updates/new" #This is in daily_updates_controller
        else
            # flash[:message] = "Incorrect login. Enter the correct username and password."
            redirect '/login'
        end
    end

    # get '/daily_updates' do #render login form 
    #     erb :"daily_updates/new"
    #     redirect '/daily_updates/success' #This is not working
    # end

    # get '/success' do 
    #     erb :"daily_updates/success" 
    # end

    get '/logout' do
        session.clear
        erb :'/users/login'
    end



end