class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  def after_sign_in_path_for(resource)
    about_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end
  
  def destroy
    sign_out(resource_name)
    redirect_to top_path
  end

  private

  def customer_state
    customer = Customer.find_by(email: params[:customer][:email])
    return if customer.nil?
    return unless customer.valid_password?(params[:customer][:password])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
