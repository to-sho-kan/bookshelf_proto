class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render
  end

  # GET /users/:id
  # GET /users/:id.json
  def show
    @user = User.find(params[:id])
    render
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.save!
    render
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :memo)
  end
end
