require 'spec_helper'

describe User do
  it { should have_many(:bids) }
  it { should have_many(:auctions) }
  it { should have_many(:bidded_items) }

  it { should have_many(:wins) }
  it { should have_many(:won_items) }
end
