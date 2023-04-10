class Api::V1::CargoTypesController < ApplicationController
  before_action :set_type, only: %i[ show update destroy]
  def index
    @types = CargoType.all
    render json: @types
  end

  def show
    render json: @type
  end

  def create
    @type = CargoType.create(type_params)
    if @type.save
      render json: @type, status: :created
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  def update
    if @type.update(type_params)
      render json: @type
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @type.destroy
  end

  private
  def set_type
    @type = CargoType.find(params[:id])
  end
  def type_params
    params.require(:cargo_type).permit(:name)
  end
end


