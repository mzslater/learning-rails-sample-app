class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  before_filter :login_required
  
  before_filter :set_pagetitle

  def set_pagetitle
    @pagetitle = 'User Administration'
  end

  def index
    @users = User.find(:all)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to(users_url)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to(user_path(@user))
    else
      render :action => 'edit'
    end
  end

  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      # We didn't explain this in the screencast, but this line needs to be commented
      # out for our purposes in this lab as we don't want to change the notion of
      # who the current user is when creating new users.
      #self.current_user = @user
      redirect_to users_path
      flash[:notice] = "New User is created!"
    else
      render :action => 'new'
    end
  end

end
