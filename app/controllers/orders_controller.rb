# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user! 
  before_action :find_course, only: [:new, :create]
  before_action :check, only: [:new, :create]

  def index
    @orders = Order.includes(:user, :course).where(user: current_user, status: "paid")
  end

  def new; end

  def create
    @order = current_user.orders.new(name: @course.title, price: @course.price, slug: SecureRandom.base64(5), course: @course, expiration_day: @course.expiration_day)
    @order.save
    @order.pay!
    redirect_to orders_path, notice: "購買成功!!!!!"
  end

  private
  def find_course
    @course = Course.find(params[:course_id])
  end

  def check
    if current_user.orders.where(status: "paid").pluck(:course_id).include? @course.id
      flash[:alert] = "你已購買過!"
      redirect_to root_path
    end
  end
end
