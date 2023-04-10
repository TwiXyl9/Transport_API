class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :set_user, only: :show
  before_action :authenticate_user!, only: [:show]
  def show
    render json: @user
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
