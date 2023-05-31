class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :set_user, only: [:show, :update]
  before_action :authenticate_user!, only: [:show, :update]
  def show
    render json: @user
  end
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :phone)
  end
end
