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
end
