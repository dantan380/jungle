class Admin::DashboardController < ApplicationController
  before_action :authenticate
  def show
    @products = Product.count
    @categories = Category.count
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['HTTP_BASIC_AUTH_USERNAME'] && password == ENV['HTTP_BASIC_AUTH_PASSWORD']
    end
  end
end
