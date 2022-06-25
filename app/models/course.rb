class Course < ApplicationRecord

  # validates
  validates :title, presence: true
  validates :price, presence: true, numericality: { less_than: 99999999 }
  validates :published, presence: true

  # relationship
  belongs_to :user

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
