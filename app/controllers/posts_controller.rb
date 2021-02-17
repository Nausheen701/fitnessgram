class PostsController < ApplicationController

    # <%= %> :interpolates ruby code in views (what our user sees )
    # <% %>  :interpolates ruby code in views but not meant to be rendered (what our views process)
get '/posts' do
    @posts = Post.all
    erb :'posts/index'
end

get '/posts/new' do
    erb :'posts/new'
end

get '/posts/:id' do
    #can grab the id's value
    params[:id]
    {id: 1}
    @post = Post.find(params[:id])
    erb :'posts/show'
end

end

