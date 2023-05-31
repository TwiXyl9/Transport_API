class Api::V1::AdditionalServicesController < ApplicationController
  before_action :set_service, only: %i[ show update destroy]
  def index
    @services = AdditionalService.all

    render json: @services
  end

  def show
    render json: @service
  end

  def create
    @service = AdditionalService.create(service_params)
    if @service.save
      render json: @service, status: :created
    else
      render json: {'errors': @service.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @service.update(service_params)
      render json: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
  end

  private
  def set_service
    @service = AdditionalService.find(params[:id])
  end
  def service_params
    params.require(:service).permit(:name, :price, :description, :image)
  end
end
