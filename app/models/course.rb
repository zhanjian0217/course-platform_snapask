class Course < ApplicationRecord

  # validates
  validates :title, presence: true
  validates :price, presence: true, numericality: { less_than: 99999999 }
  validates :published, presence: true

  # relationship
  belongs_to :user

  # callback
  after_find do |course|
    end_time = course.end_time
    if end_time && end_time < Date.current
      course.update(published: "draft")
    end
  end

  # scope
  scope :published, -> { where(published: "publish") }


  def self.published_state
    [
      %w[
        上架 publish
      ],
      %w[
        下架 draft
      ]
    ]
  end
end
