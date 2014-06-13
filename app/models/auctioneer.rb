class Auctioneer < ActiveRecord::Base
  def start_auction(auction)
    auction.active = true
  end

  def call_auction(auction)
    auction.active = false
    if auction.current_bid >= auction.reserve
      Win.create(user: auction.bids.order(amount: :desc).first.user, item: auction.item, amount: auction.current_bid)
      auction.item.sold = true
      auction.success = true
    else
      auction.success = false
    end
    auction.save
  end
end
