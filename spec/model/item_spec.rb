require 'spec_helper'

describe Item do
  it { should have_many(:auctions) }
  it { should have_many(:bids) }
  it { should have_many(:bidders) }

  it { should have_one(:win) }
  it { should have_one(:winner) }

  it { should validate_uniqueness_of(:name) }
end
