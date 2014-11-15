class PostController < ApplicationController
  def index
  	if session[:user_id] == nil
  		@register_flag = true
  	else
  		@register_flag = false
  		@user = User.find(session[:user_id])
  	end

  	@posts = Post.all
  	@users = User.all
  end

  def new
  	@title = params[:title]
  	@content = params[:content]

  	create_post(@title, @content)
  end

  def create_post(title, content)
  	if session[:user_id]
  		@post = Post.create({:title => @title, :content =>  @content, :user_id => session[:user_id]})
  	else
  		@post = Post.create({:title => @title, :content =>  @content})
  	end
  	
  	if @post.valid?
  		redirect_to action: :index
  	else

  	end
  end

  def view
  	@post_id = params[:post_id]
  	@post = Post.find(@post_id)
  end

  def edit
  	@post_id = params[:post_id]
  	@post = Post.find(@post_id)


  	if request.post?
  		@post.update_attributes({:title => params[:title],:content => params[:content]})
  		if @post.valid?
  		redirect_to action: :index
  		end
  	end
  end
end
