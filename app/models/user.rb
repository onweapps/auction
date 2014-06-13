class User < ActiveRecord::Base
  has_many :bids
  has_many :auctions, through: :bids
  has_many :bidded_items, through: :auctions, source: :item

  has_many :wins
  has_many :won_items, through: :wins, source: :item
end
