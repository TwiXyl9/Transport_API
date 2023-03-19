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
        @capacity = Capacity.create(capacity_params)
        if @capacity.save
          @car = Car.create(car_params)
          if @car.save
            render json: @car, status: :created
          else
            render json: @car.errors, status: :unprocessable_entity
          end
        else
          render json: @capacity.errors, status: :unprocessable_entity
        end
      end

      def update
        if @car.update(car_params)
          render json: @car
        else
          render json: @car.errors, status: :unprocessable_entity
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

