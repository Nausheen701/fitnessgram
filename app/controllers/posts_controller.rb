class PostsController < ApplicationController

    # <%= %> :interpolates ruby code in views (what our user sees )
    # <% %>  :interpolates ruby code in views but not meant to be rendered (what our views process)
get '/posts' do
    @posts = Post.all
    erb :'posts/index'
end

# user made a request to view form to add a new post
get '/posts/new' do
    erb :'posts/new'
end

# show route
get '/posts/:id' do
    #can grab the id's value
    # params[:id]
    # {id: 1}
    @post = Post.find_by(id:params[:id])
    erb :'posts/show'
end


# user wants to see details of 1 post
# show route

# user submitted new post form
post '/posts' do
    # @post = Post.new(title: params[:title], content: params[:content])
    # @post = Post.new(params)
    # @post.save
    @post = Post.create(params)
    redirect "posts/#{post.id}"
    # create the new post
    # redirect user somewhere
    # erb :'posts/new'
end

# user requested to see an edit form

get 'posts/:id/edit' do
    # retrieve the object
    # autofill form with the details of 
    # render to user to fill out

end




end

