class SessionsController < ApplicationController
  before_action :customer_state, only: [:create]
  
  
  def destroy
    sign_out(resource_name)
    redirect_to tops
  end

  private

def customer_state
  customer = Customer.find_by(email: params[:customer][:email])
  return if customer.nil?
  return unless customer.valid_password?(params[:customer][:password])
end
end
