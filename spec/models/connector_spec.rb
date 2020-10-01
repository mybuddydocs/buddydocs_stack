require 'rails_helper'

RSpec.describe Connector, type: :model do

  subject {
    described_class.new(name: "test",
                        url: "www.test.fr")
}
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).not_to be_valid
    end
    it 'is valid without an url' do
      subject.url = nil
      expect(subject).not_to be_valid
    end
end
