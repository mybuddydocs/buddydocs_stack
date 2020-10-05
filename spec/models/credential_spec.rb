require 'rails_helper'

RSpec.describe Credential, type: :model do
  let(:john) {create(:user)}
  let(:connector) {create(:connector)}

  subject { create(:credential, user: john, connector: connector)}

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is invalid without a login' do
    subject.login = nil
    expect(subject).not_to be_valid
  end
  it 'is invalid without a password' do
    subject.password = nil
    expect(subject).not_to be_valid
  end
  it 'should respond to launch_connector method' do
    expect(subject).to respond_to :launch_connector
  end
  # it ' should launch specific spider' do
  #   connector.name = "udemy_connector"
  #   expect(subject.launch_connector).to respond_to (:Spiders::SpiderUdemy.parse!).with(3).arguments
  # end
end
