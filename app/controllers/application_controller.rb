class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_customer!

  protected

  # This method allows us to add custom parameters to the Devise sign-up and account update forms
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :company_name, :function, :phone, :address, :city, :country])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :company_name, :function, :phone, :address, :city, :country])
  end

  # This method determines the path to redirect to after a successful sign-in
  def after_sign_in_path_for(resource)
    if resource.is_a?(Administrator)
      admin_dashboard_path  # This uses the named route helper
    elsif resource.is_a?(Customer)
      customer_dashboard_path  # This uses the named route helper
    else
      root_path
    end
  end

  def authenticate_customer
    unless current_customer && current_customer.approved?
      redirect_to root_path, alert: 'You must be approved to access this section.'
    end
  end
end
