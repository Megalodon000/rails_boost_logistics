# app/controllers/admin/dashboards_controller.rb
module Admin
  class DashboardsController < ApplicationController
    before_action :authenticate_administrator! # Ensure this method matches the new model

    def admin
      # Code for displaying the admin dashboard
    end

    def blog_management
      @blogs = Blog.all
    end

    def booking_management
      @bookings = Booking.all
    end

    def tracking_management
      @trackings = Tracking.all
    end
  end
end
