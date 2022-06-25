class Owner::OrdersController < ApplicationController
  layout "owner"
  before_action :authenticate_user!  # 這個是 devise 提供的方法，先檢查必須登入
  before_action :authenticate_admin # 再檢查是否有權限

  def index
    @courses = current_user.courses
    @orders = Order.includes(:user).where(course: @courses).paid.order(id: :desc)    

    if params[:days]
      return @orders if params[:days] == '0'
      @order_option = params[:days]
      @orders = @orders.time_select(params[:days])
    else
      @orders
    end
  end
end
