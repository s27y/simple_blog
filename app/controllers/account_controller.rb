class AccountController < ApplicationController
  def create
  	if request.post?
  		@username = params[:username]
  		@password = params[:password]

  		@user = User.create({:username => @username, :password =>  @password})
  		if @user.valid?
  		redirect_to action: :login
  		else

  		end

  	end

  end

  def login
  	@users = User.all
  	if request.post?
  		@username = params[:username]
  		@password = params[:password]

  		@user = User.where(["username = ? and password = ?", @username, @password]).first
  		if @user 
  				session[:user_id] = @user.id
  				redirect_to controller: :post, action: :index
  			
  		else
  			redirect_to action: :create
  		end
  	end
  end

  def user_detail
	@user = User.find(session[:user_id])
  end

  def logout
  	session[:user_id] = nil
  	redirect_to controller: :post, action: :index
  end
end
