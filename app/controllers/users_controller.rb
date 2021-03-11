
class UsersController < ApplicationController
   
   
    get '/signup' do             
        if logged_in?
            redirect 'daily_updates'
        else
            erb :"users/signup"
        end
    end

    post '/signup' do         
    user = User.new(params) 
        if user.username.blank? || user.email.blank? || user.name.blank? || user.password.blank? 
            flash[:error] = "Enter valid data in the signup form. Do not leave any fields blank."
            redirect '/signup'
        elsif User.find_by_email(params[:email]) || User.find_by_username(params[:username])
            flash[:error] = "Looks like account with this email or username already exists. Create a new account or login."
            redirect '/signup'
        else 
            user.save
            session[:user_id] = user.id #logging user in
            redirect '/daily_updates' 
        end
    end
            

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
            redirect "/daily_updates"
        else
         flash[:error] = "Incorrect login. Enter the correct username and password."
            redirect '/login'
        end
    end


    get '/logout' do
        session.clear
        flash[:error] = "You have logged out. Login again to continue sharing your fitness journey!"
       redirect '/login'
    end



end

#  .find can return an error
#  .find_by_<attr> will return nil if data does not exit