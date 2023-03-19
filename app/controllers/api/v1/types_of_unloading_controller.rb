module Api
  module V1
    class TypesOfUnloadingController < ApplicationController
      before_action :set_type, only: %i[ show update destroy]
      def index
        @types = TypeOfUnloading.all

        render json: @types
      end

      def show
        render json: @types
      end

      def create
        @type = TypeOfUnloading.create(type_params)
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
        @type = TypeOfUnloading.find(params[:id])
      end

      def type_params
        params.require(:type).permit(:name)
      end
    end
  end
end

