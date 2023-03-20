module Api
  module V1
    class CarsController < ApplicationController
      before_action :set_car, only: %i[ show update destroy]
      def index
        @cars = Car.all

        render json: @cars
      end

      def show
        render json: @car
      end

      def create
        Car.transaction do
          @capacity = Capacity.new(capacity_params)
          if @capacity.save
            @car = Car.new(car_params)
            if @car.save
              render json: @car, status: :created
            else
              render json: @car.errors, status: :unprocessable_entity
              raise ActiveRecord::Rollback
            end
          else
            render json: @capacity.errors, status: :unprocessable_entity
          end
        end
      end

      def update
        @capacity = @car.capacity
        if !@capacity.update(capacity_params)
          render json: @capacity.errors, status: :unprocessable_entity
        else
          if @car.update(car_params)
            render json: @car , status: :created
          else
            render json: car.errors, status: :unprocessable_entity
          end
        end
      end

      def destroy
        @car.destroy
      end

      private
      def set_car
        @car = Car.find(params[:id])
      end

      def capacity_params
        params.require(:capacity).permit(:width,:height,:length,:num_of_pallets)
      end

      def car_params
        params[:car].merge!(:capacity_id => @capacity.id)
        params.require(:car).permit(:brand,:model,:capacity_id)
      end

    end
  end
end

