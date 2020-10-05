require 'rails_helper'

RSpec.describe Credential, type: :model do
  let(:john) {create(:user)}
  let(:connector) {create(:connector)}
  let(:spider) {instance_double(Spiders::SpiderUdemy)}
  before do
    allow(Spiders::SpiderUdemy).to receive(:parse!).and_return(true)
  end

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
  it ' should launch specific spider depending of the connector name' do
    connector.name = "udemy_connector"
    subject.launch_connector
    expect(Spiders::SpiderUdemy).to have_received(:parse!)
  end
end
