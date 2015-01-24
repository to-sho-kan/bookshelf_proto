class UsersController < ApplicationController

  before_action :id_search, only: [:show, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render
  end

  # GET /users/:id
  # GET /users/:id.json
  def show
    render
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    render
  end

  # POST /user/:id
  def update
    edit_user = snake_params
    puts edit_user
    @user.update_attributes(first_name: edit_user[:user]['first_name'],
                            last_name: edit_user[:user]['last_name'],
                            memo: edit_user[:user]['memo'])
    render
  end

  private

  def user_params
    snake_params.require(:user).permit(:first_name, :last_name, :memo)
  end

  def snake_params
    params[:user].transform_keys!(&:underscore)
    params
  end

  def id_search
    @user = User.find(params[:id])
  end
end
