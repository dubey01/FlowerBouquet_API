module Api
  module V1
    class FlowersController < ApplicationController
      def index
        flowers = Flower.order('id ASC')
        render json: {status: 'SUCCESS', message:'List of Available Flowers', data: flowers}, status: :ok
      end

      def show
        flower = Flower.find(params[:id])
        render json: {status: 'SUCCESS', message:'Selected Flower', data: flower}, status: :ok
      end

      def create
        flower = Flower.new(flower_params)

        if flower.save
          render json: {status: 'SUCCESS', message:'Flower Details Saved', data: flower}, status: :ok
        else
          render json: {status: 'Error', message:'Unable to Save', data: flower.errors}, status: :failed_saving
        end
      end

      def destroy
        flower = Flower.find(params[:id])
        flower.destroy
        render json: {status: 'SUCCESS', message:'Flower Removed', data: flower}, status: :ok

      end

      def update
        flower = Flower.find(params[:id])

        if flower.update_attributes(flower_params)
          render json: {status: 'SUCCESS', message:'Flower Details Updated', data: flower}, status: :ok
        else
          render json: {status: 'Failure in updation', message:'Updation of details failed', data: flower.errors}, status: :ok
        end
      end

      private

      def flower_params
        params.permit(:name, :color, :cost)
      end

    end
  end
end