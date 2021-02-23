class DailyUpdatesController < ApplicationController

    # allows users to post updates
    # <%= %> :interpolates ruby code in views (what our user sees )
    # <% %>  :interpolates ruby code in views but not meant to be rendered (what our views process)
get '/daily_updates' do
    # @post = Post.all
    erb :'daily_updates/index'
end

# user made a request to view form to add a new post
get '/daily_updates/new' do
    erb :'daily_updates/new'
end
        

# show route
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

# user requested to see an edit form

get 'daily_updates/:id/edit' do
    # retrieve the object
    # autofill form with the details of 
    # render to user to fill out
end

  # get '/daily_updates' do #render login form 
    #     erb :"daily_updates/new"
    #     redirect '/daily_updates/success' #This is not working
    # end

    # get '/success' do 
    #     erb :"daily_updates/success" 
    # end

private 

    def get_daily_update
        @daily_update = DailyUpdate.find_by(id:params[:id])
    end 


end

