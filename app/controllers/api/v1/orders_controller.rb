module Api
module V1

class OrdersController < ApplicationController
  def index
    orders = Order.order('id ASC')
    render json: {status: 'SUCCESS', message:'List of Available Orders', data: orders}, status: :ok
  end

  def show
    order = Order.find(params[:id])
    render json: {status: 'SUCCESS', message:'Selected Order', data: order}, status: :ok
  end

  def create
    order = Order.new(order_params)

    if order.save
      render json: {status: 'SUCCESS', message:'Order Details Saved', data: order}, status: :ok
    else
      render json: {status: 'Error', message:'Unable to Save', data: order.errors}, status: :failed_saving
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    render json: {status: 'SUCCESS', message:'Order Removed', data: order}, status: :ok

  end

  def update
    order = Order.find(params[:id])

    if order.update_attributes(order_params)
      render json: {status: 'SUCCESS', message:'Order Details Updated', data: order}, status: :ok
    else
      render json: {status: 'Failure in updation', message:'Updation of details failed', data: order.errors}, status: :ok
    end
  end

  private

  def order_params
    params.permit(:order_id, :order_amount, :customer_id)
  end
end
end
end