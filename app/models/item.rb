class Item < ActiveRecord::Base
  has_many :auctions
  has_many :bids, through: :auctions
  has_many :bidders, through: :bids, source: :user

  has_one :win
  has_one :winner, through: :win, source: :user

  validates :name, uniqueness: true

  def latest_action
    latest_auction = Auction.find_by("item_id = #{self.id}")
    if latest_auction
      {latest_action: latest_auction, current_bid: latest_auction.current_bid, winner: latest_auction.item.winner}
    else
      "there are no actions in the database"
    end
  end

  def self.by_name(name)
    self.where(name: name).first
  end
end
