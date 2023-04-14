class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy]
  def index
    if params[:user_id]
      @orders = User.find_by_id(params[:user_id]).orders
    else
      @orders = Order.all
    end
    render json: @orders
  end

  def show
    render json: @order
  end

  def create
    Order.transaction do
      @start_point = Point.new(start_point_params)
      @end_point = Point.new(end_point_params)
      if @start_point.save
        if @end_point.save
          @route = Route.new(start_point: @start_point, end_point: @end_point)
          if @route.save
            @order = Order.new(order_params)
            if @order.save
              render json: @order, status: :created
            else
              render json: @order.errors, status: :unprocessable_entity
              raise ActiveRecord::Rollback
            end
          end
        else
          render json: @end_point.errors, status: :unprocessable_entity
        end
      else
        render json: @start_point.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end
  def start_point_params
    params[:order].require(:route).require(:start_point).permit(:latitude,:longitude,:address)
  end
  def end_point_params
    params[:order].require(:route).require(:end_point).permit(:latitude,:longitude,:address)
  end
  def order_params
    params[:order].merge!(:route_id => @route.id)
    params.require(:order).permit(:name,:phone,:date,:cargo_type_id,:car_id, :user_id, :route_id, order_additional_services_attributes: [:amount, :additional_service_id])
  end
end
