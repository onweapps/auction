class Auction < ActiveRecord::Base
  belongs_to :item
  has_many :bids

  validates :item, presence: true
  before_create :item_sold?

  def item_sold?
    unless !self.item.sold
      errors.add(:item, "That item is sold")
      raise("That item is sold")
    end
  end

  def current_bid
    self.bids.pluck(:amount).sort.last
  end

end
