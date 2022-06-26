# forzen_string_literal: true

module Owner
  class OrdersController < Owner::BaseController
    layout "owner"


    def index
      @courses = Course.all 
      @orders = Order.includes(:user, :course).order(id: :desc)    
    end
  end
end