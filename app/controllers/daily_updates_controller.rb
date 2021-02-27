class DailyUpdatesController < ApplicationController

    # allows users to post updates
    # <%= %> :interpolates ruby code in views (what our user sees )
    # <% %>  :interpolates ruby code in views but not meant to be rendered (what our views process)

# READ
get '/daily_updates' do
    @daily_updates = DailyUpdate.all
    erb :'daily_updates/index'
end

# CREATE  user made a request to view form to add a new post
get '/daily_updates/new' do
#    Need to authenticate current user?
    erb :'daily_updates/new'
end
   
#  READ?
# show route
# What is this route doing?
get '/daily_updates/:id' do
    #can grab the id's value
    # params[:id]
    # {id: 1}
    get_daily_update
    erb :'daily_updates/show'
end

# user wants to see details of 1 post
# show route

# user submitted new post form
post '/daily_updates' do
    # @daily_update = DailyUpdate.create(params)
    @daily_update = DailyUpdate.new(params) #.new & .save
    @daily_update.user_id = session[:user_id]
    @daily_update.save
    redirect "/daily_updates/#{@daily_update.id}"  #must use double quotes when interpolating
    # create the new post
    # redirect user somewhere
    # erb :'posts/new'
end

# UPDATE
# user requested to see an edit form
get '/daily_updates/:id/edit' do
    get_daily_update
    if @daily_update.user == current_user
        erb :"/daily_updates/edit"
    else 
        flash[:error] = "You do not have permission to edit another user's daily update."
        redirect '/daily_updates'
    end
    # retrieve the object
    # autofill form with the details of that object
    # render to user to fill out
end

# user just submitted the edit form
patch '/daily_updates/:id' do 
    # get_daily_update
    @daily_update = DailyUpdate.find_by_id(params[:id])

    if @daily_update.user == current_user && !params[:caption].empty? && !params[:workout_type].blank? && !params[:workout_minutes].blank? && !params[:calories_burned].blank? 
        @daily_update.update(caption: params[:caption], workout_type: params[:workout_type], workout_minutes: params[:workout_minutes], calories_burned: params[:calories_burned])
        redirect "/daily_updates/#{@daily_update.id}" 
    else 
        flash[:error] = "You do not have permission to edit another user's daily update."
        redirect '/daily_updates'
    end
    
    # @post.update
    # no view 
    # update the particular object with new attributes
end 

# DELETE
 # user wants to delete an existing post 
 delete '/daily_updates/:id' do 
    get_daily_update
    @daily_update.destroy
    redirect '/daily_updates'
    # no view 
end 

private 

    def get_daily_update
        @daily_update = DailyUpdate.find_by(id:params[:id])
    end 

end

