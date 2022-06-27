class Order < ApplicationRecord
  include AASM

  aasm column: "status" do
    state :pending, initial: true
    state :paid
    state :expired

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :renew do
      transitions from: [:paid, :expired], to: :expired
    end

  end
 
  # callback
  after_find do |order|
    expiration_day =  order.order_expiration_day

    if expiration_day <= Date.current
      order.renew!
    end
  end

  # relationship
  belongs_to :user
  belongs_to :course

  def order_expiration_day
    self.created_at.to_date + (self.expiration_day).days 
  end
end
