class AddCourseToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :course, foreign_key: true
  end
end
