require 'spec_helper'

describe Auction do
  it { should belong_to(:item) }
  it { should have_many(:bids) }
  it { should respond_to(:current_bid)}
  it { should validate_presence_of(:item) }

  describe "#create" do
    it "should fail with a sold item" do
      item = Item.create(name: "item", sold: true)
      expect{ Auction.create(item: item, reserve: 20) }.to raise_error
    end
  end
end
