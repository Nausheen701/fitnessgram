class DailyUpdatesController < ApplicationController

# READ
get '/daily_updates' do
    @daily_updates = DailyUpdate.all #creating daily updates variable to be used in index view to render info
    erb :'daily_updates/index'
end

# CREATE  
get '/daily_updates/new' do
    erb :'daily_updates/new'
end
   
#  READ
get '/daily_updates/:id' do
    #can grab the id's value
    get_daily_update
    erb :'daily_updates/show'
end

#CREATE
post '/daily_updates' do
    @daily_update = DailyUpdate.new(params) #.new & .save
    @daily_update.user_id = session[:user_id]
    if @daily_update.user == current_user && !params[:caption].empty? && !params[:workout_type].empty? && !params[:workout_minutes].empty? && !params[:calories_burned].empty? 
        @daily_update.save
        redirect "/daily_updates/#{@daily_update.id}" 
    else
        flash[:error] = "You must complete all fields to create a daily update. Try again."
        redirect '/daily_updates/new' 
    end
   
end

# UPDATE
get '/daily_updates/:id/edit' do
    get_daily_update
    if @daily_update.user == current_user
        erb :"/daily_updates/edit"
    else 
        flash[:error] = "You do not have permission to edit another user's daily update."
        redirect '/daily_updates'
    end
end

#UPDATE
patch '/daily_updates/:id' do 
    @daily_update = DailyUpdate.find_by_id(params[:id])
    if @daily_update.user == current_user && !params[:caption].empty? && !params[:workout_type].empty? && !params[:workout_minutes].empty? && !params[:calories_burned].empty? 
        @daily_update.update(caption: params[:caption], workout_type: params[:workout_type], workout_minutes: params[:workout_minutes], calories_burned: params[:calories_burned])
        redirect "/daily_updates/#{@daily_update.id}" 
    else 
        flash[:error] = "You do not have permission to edit another user's daily update."
        redirect '/daily_updates'
    end
    
end 

#DELETE
 delete '/daily_updates/:id' do 
    get_daily_update
    if @daily_update.user == current_user
    @daily_update.destroy
    redirect '/daily_updates'
    else 
        flash[:error] = "You do not have permission to delete another user's daily update."
        redirect '/daily_updates'    
    end
end 

private 

    def get_daily_update
        @daily_update = DailyUpdate.find_by(id:params[:id])
    end 

end

