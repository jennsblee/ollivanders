class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home; end

  def dashboard
    @user = current_user
    @wands = @user.wands
    @wands_string = @wands.map { |rating| rating.rating_count }.join(", ")
    @bookings = @user.bookings
  end

  # def about; end
end
