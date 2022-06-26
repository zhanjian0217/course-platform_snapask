class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # relationship
  has_many :courses
  
  

  
  def admin?
    self.role == "admin"
  end

  def admin!
    update(role: "admin")
  end   
end
