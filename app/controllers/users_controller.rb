class UsersController < ApplicationController
  
  before_filter :authorize, on: [:edit, :update, :destroy]
  before_filter :find_user, on: [:edit, :update, :destroy]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      flash[:notice] = t "flash_messages.user.created_successfully"
      redirect_to root_path
    else
      flash[:error] = t "flash_messages.user.error_on_creation"
      render action: :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes params[:user]
      flash[:notice] = t "flash_messages.user.updated_successfully"
      redirect_to root_path
    else
      flash[:error] = t "flash_messages.user.error_on_update"
      redirect_to root_path
    end
  end
  
  def destroy
    
  end
  
  private
  def find_user
    if current_user.role < Role::ADMIN
      flash[:alert] = t "flash_messages.user.edit_yourself_only"
      @user = current_user
    else
      @user = User.find params[:id]
    end
  end
  
end
