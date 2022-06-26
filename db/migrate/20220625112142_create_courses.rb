class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string "title"
      t.text "content"
      t.integer "price"
      t.string "published", default: "draft"
      t.bigint "user_id", null: false  
      t.integer "expiration_day"


      t.timestamps
    end
  end
end
