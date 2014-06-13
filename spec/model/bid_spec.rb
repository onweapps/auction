require 'spec_helper'

describe Bid do
  it { should belong_to(:auction) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:auction) }

  describe "#create" do

    context "with an inactive auction" do
      item = Item.create
      auction = Auction.create(item: item, active: false)
      it "should fail because of inactivity" do
        expect{ Bid.create(auction: auction, user: User.create, amount: 0) }.to raise_error
      end
    end

    context "with an active auction" do
      item = Item.create
      auction = Auction.create(item: item, active: true)
      it "should fail because of inactivity" do
        expect{ Bid.create(auction: auction, user: User.create, amount: 0) }.to change {Bid.count}.by(1)
      end
    end
  end
end
