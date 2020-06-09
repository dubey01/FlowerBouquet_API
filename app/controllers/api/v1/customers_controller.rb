module Api
module V1

class CustomersController < ApplicationController
  def index
    customers = Customer.order('id ASC')
    render json: {status: 'SUCCESS', message:'List of Customers', data: customers}, status: :ok
  end

  def show
    customer = Customer.find(params[:id])
    render json: {status: 'SUCCESS', message:'Selected Customer', data: customer}, status: :ok
  end

  def create
    customer = Customer.new(customer_params)

    if customer.save
      render json: {status: 'SUCCESS', message:'Customer Details Saved', data: customer}, status: :ok
    else
      render json: {status: 'Error', message:'Unable to Save', data: customer.errors}, status: :failed_saving
    end
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    render json: {status: 'SUCCESS', message:'Customer Removed', data: customer}, status: :ok

  end

  def update
    customer = Customer.find(params[:id])

    if customer.update_attributes(customer_params)
      render json: {status: 'SUCCESS', message:'Customer Details Updated', data: customer}, status: :ok
    else
      render json: {status: 'Failure in updation', message:'Updation of details failed', data: customer.errors}, status: :ok
    end
  end

  private

  def customer_params
    params.permit(:name, :address)
  end
end
end
end
