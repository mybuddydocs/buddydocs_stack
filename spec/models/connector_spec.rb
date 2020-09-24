require 'rails_helper'

RSpec.describe Connector, type: :model do
  context 'General settings' do
    it "is not valid without a name" do
      connector = Connector.new( name: nil)
      expect(connector).to_not be_valid
    end
    it 'is valid with a correct url' do
      connector = Connector.new( name: "Udemy_connector")
      expect(connector).to be_valid
    end
  end
end
