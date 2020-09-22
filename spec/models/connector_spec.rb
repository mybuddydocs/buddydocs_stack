require 'rails_helper'

RSpec.describe Connector, type: :model do
  it "is not valid without an URL" do
    connector = Connector.new(url: nil)
    expect(connector).to_not be_valid
  end
  it 'is valid with a correct url' do
    connector = Connector.new(url: "https://www.udemy.com/dashboard/purchase-history/")
    expect(connector).to be_valid
  end
end
