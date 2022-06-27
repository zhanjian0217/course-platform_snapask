# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    @courses = Course.includes(:user).published
    orders = Order.all
  end
end
