class AdminController < ApplicationController
  def index
  	@posts = Post.all.order('created_at desc')
    @users = User.all
  end

  def delete
  	@post_id = params[:post_id]
  	@post = Post.find(@post_id)

  	if request.post?
  		@post.destroy
  		redirect_to action: :index
  	end
  end


end
