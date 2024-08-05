Rails.application.routes.draw do
  devise_for :administrators

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Route for authenticated administrators
  authenticated :administrator do
    root to: 'admin/dashboards#admin', as: :admin_root
  end

  # Namespace for admin routes
  namespace :admin do
    get 'dashboards/admin', to: 'dashboards#admin'
    get 'dashboard', to: 'dashboards#admin', as: :admin_dashboard
  end

  # Root route for unauthenticated users
  root to: 'home#index'
end
