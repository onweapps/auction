class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates :amount, presence: true
  validates :user, presence: true
  validates :auction, presence: true

  before_create :active?
  before_create :check_amount

  def active?
    unless self.auction.active
      errors.add(:auction, "That auction is not active.")
      raise("That auction is not active.")
    end
  end

  def check_amount
    unless self.auction.bids.empty? || self.amount > self.auction.current_bid
      errors.add(:amount, "Bid is not higher than current bid.")
      raise("Bid is not higher than current bid.")
    end
  end
end
