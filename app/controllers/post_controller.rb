class PostController < ApplicationController
  def index
  	@posts = Post.all
  	puts @posts.size

  end

  def new
  	@title = params[:title]
  	@content = params[:content]

  	create_post(@title, @content)
  end

  def create_post(title, content)
  	@post = Post.create({:title => @title, :content =>  @content})
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
