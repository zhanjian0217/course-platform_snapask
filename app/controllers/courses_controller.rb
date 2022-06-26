# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    @courses = Course.includes(:orders, :user).published
  end
end
