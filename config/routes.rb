Rails.application.routes.draw do
  # Devise routes for customers
  devise_for :customers, path: 'customers', controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }

  # Devise routes for administrators
  devise_for :administrators, path: 'administrators', controllers: {
    sessions: 'admin_panel/administrators/sessions',
    registrations: 'admin_panel/administrators/registrations'
  }

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Route for authenticated administrators
  authenticated :administrator do
    root to: 'admin_panel/dashboards#admin', as: :administrator_root
  end

  # Route for authenticated customers
  authenticated :customer do
    root to: 'customer/dashboards#customer', as: :customer_root
  end

  # Namespace for admin_panel routes
  namespace :admin_panel do
    get 'dashboard', to: 'dashboards#admin', as: :admin_dashboard
    get 'blog_management', to: 'dashboards#blog_management', as: :blog_management
    get 'pending_registrations', to: 'dashboards#pending_registrations', as: :pending_registrations
    patch 'approve_registration/:id', to: 'dashboards#approve_registration', as: :approve_registration
    delete 'reject_registration/:id', to: 'dashboards#reject_registration', as: :reject_registration
    get 'booking_management', to: 'dashboards#booking_management', as: :booking_management
    get 'tracking_management', to: 'dashboards#tracking_management', as: :tracking_management
  end

  # Namespace for customer routes
  namespace :customer_panel do
    get 'trackings/index'
    get 'trackings/show'
    get 'bookings/new'
    get 'bookings/create'
    get 'bookings/show'
    get 'blogs/index'
    get 'dashboard', to: 'dashboards#customer', as: :customer_dashboard
    get 'blogs', to: 'blogs#index'
    resources :bookings, only: [:new, :create, :show]
    resources :trackings, only: [:index, :show]
  end

  # Root route for unauthenticated users
  unauthenticated do
    root to: 'home#index'
  end
end
