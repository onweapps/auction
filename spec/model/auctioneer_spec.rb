require 'spec_helper'

describe Auctioneer do
  item = Item.create
  user = User.create
  auction = Auction.create(item: item, reserve: 20)
  auctioneer = Auctioneer.create

  describe "#start_auction" do

    it "should change auction to active" do
      expect{ auctioneer.start_auction(auction)}.to change {auction.active}.to(true)
    end

  end

  describe "#call_auction" do

    it "should change auction to inactice" do
      auctioneer.start_auction(auction)
      bid = Bid.create(user: user, auction: auction, amount: 10)
      expect{ auctioneer.call_auction(auction)}.to change {auction.active}.to(false)
    end

    it "should assign a winner with a winning bid" do
      auctioneer.start_auction(auction)
      bid = Bid.create(user: user, auction: auction, amount: 21)
      expect{ auctioneer.call_auction(auction)}.to change {Win.count}.by(1)
    end

  end

end
