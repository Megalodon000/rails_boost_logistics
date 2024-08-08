class AdminPanel::Administrators::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    administrator_root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_administrator_session_path
  end
end
