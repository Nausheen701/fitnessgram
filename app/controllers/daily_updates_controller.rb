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
    @daily_update = DailyUpdate.find_by(id: params[:id])
    erb :'daily_updates/show'
end

# user wants to see details of 1 post
# show route

# user submitted new post form
post '/daily_updates' do
    # @post = Post.new(title: params[:title], content: params[:content])
    # @post = Post.new(params)
    # @post.save
    @daily_update = DailyUpdate.create(params)
    redirect "daily_updates/#{@daily_update.id}"
    # create the new post
    # redirect user somewhere
    # erb :'posts/new'
end

# UPDATE
# user requested to see an edit form
get 'daily_updates/:id/edit' do
    @daily_update = DailyUpdate.find_by(id:params[:id])
        erb :"/daily_updates/edit"
    # retrieve the object
    # autofill form with the details of that object
    # render to user to fill out
end

# user just submitted the edit form
patch '/daily_updates/:id' do 
    get_daily_update
    @daily_update.update(title: params[:title], content: params[:content])
    redirect "/daily_updates/#{@daily_update.id}" 
    # @post.update
    # no view 
    # update the particular object with new attributes
end 

# DELETE
 # user wants to delete an existing post 
 delete '/daily_updates/:id' do 
    @daily_update = DailyUpdate.find_by(id:params[:id])
    @daily_update.destroy
    redirect '/daily_updates'
    # no view 
end 

private 

    def get_daily_update
        @daily_update = DailyUpdate.find_by(id:params[:id])
    end 

end

