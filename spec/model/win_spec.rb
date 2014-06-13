require 'spec_helper'

describe Win do
  it { should belong_to(:item) }
  it { should belong_to(:user) }
end
