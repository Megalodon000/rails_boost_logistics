module CustomerPanel
  class DashboardsController < ApplicationController
    before_action :authenticate_customer!

    def customer
      @blogs = Blog.all
      @booking = Booking.new
    end
  end
end
