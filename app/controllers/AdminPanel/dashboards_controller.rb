module AdminPanel
  class DashboardsController < ApplicationController
    before_action :authenticate_administrator!

    def admin
      @blogs = Blog.order(created_at: :desc).limit(5)
      @recent_bookings = Booking.order(created_at: :desc).limit(5)
      @recent_trackings = Tracking.order(created_at: :desc).limit(5)
      @bookings = Booking.all
      @trackings = Tracking.all
      @pending_customers = Customer.where(approved: false)
    end

    def blog_management
      @blogs = Blog.page(params[:page]).per(10) # Paginate with 10 blogs per page
    end

    def pending_registrations
      @pending_customers = Customer.where(approved: false)
    end

    def approve_registration
      customer = Customer.find(params[:id])
      customer.update(approved: true)
    end
    
    def reject_registration
      customer = Customer.find(params[:id])
      customer.destroy
      # Notify the customer or redirect as needed
    end

    def booking_management
      @bookings = Booking.page(params[:page]).per(10) # Paginate with 10 bookings per page
    end

    def tracking_management
      @trackings = Tracking.page(params[:page]).per(10) # Paginate with 10 trackings per page
    end
  end
end
