# frozen_string_literal: true
module Owner
  class CoursesController < ApplicationController
    layout "owner"
    before_action :find_course, only:[:update, :destroy, :edit, :information]
    before_action :authenticate_user!
    before_action :authenticate_admin 

    def index
      @courses = current_user.courses.order(id: :asc)
    end

    def new
      @course = current_user.courses.new
    end

    def create
      @course = current_user.courses.new(course_params)
      if @course.save
        redirect_to owner_courses_path(@course), notice: "新增成功！"
      else
        render :new, alert: "填寫完整資料！"
      end
    end
    
    def edit; end

    def update
      if @course.update(course_params)
        redirect_to owner_courses_path, notice: "更新成功！"
      else
        render :information
      end
    end

    def show; end
    def destroy
      @course.destroy
      redirect_to owner_courses_path, alert: "刪除成功！"
    end


    def comments; end

    private

    def find_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :end_time, :content, :price, :published)
    end
  end
end
