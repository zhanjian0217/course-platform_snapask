class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # relationship
  has_many :courses
  has_many :orders


  def bought?(course)
    orders.where(status: "paid").exists?(course_id: course.id)
  end

  def expired?(course)
    orders.find_by(status: "paid", course_id: course.id).order_expiration_day
  end
  
  def admin?
    self.role == "admin"
  end

  def admin!
    update(role: "admin")
  end   

  def myorders
    includes(:courses).orders
  end
end
