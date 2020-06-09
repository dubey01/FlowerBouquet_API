module Api
  module V1
    class BouquetsController < ApplicationController
      def index
        bouquets = Bouquet.order('id ASC')
        render json: {status: 'SUCCESS', message:'List of bouquets', data: bouquets}, status: :ok
      end

      def show
        bouquet = Bouquet.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded bouquet', data: bouquet}, status: :ok
      end

      def create
        bouquet = Bouquet.new(bouquet_params)

        if bouquet.save
          render json: {status: 'SUCCESS', message:'Bouquet Saved', data: bouquet}, status: :ok
        else
          render json: {status: 'Error', message:'Unable to load', data: bouquet.errors}, status: :failed_save
        end
      end

      def destroy
        bouquet = Bouquet.find(params[:id])
        bouquet.destroy
        render json: {status: 'SUCCESS', message:'Bouquet Removed', data: bouquet}, status: :ok

      end

      def update
        bouquet = Bouquet.find(params[:id])

        if bouquet.update_attributes(bouquet_params)
          render json: {status: 'SUCCESS', message:'Bouquet Updated', data: bouquet}, status: :ok
        else
          render json: {status: 'Failure (Failed Updation)', message:'Bouquet not able to update', data: bouquet.errors}, status: :ok
        end
      end

      private

      def bouquet_params
        params.permit(:name, :size, :cost)
      end

    end
  end
end