require 'rails_helper'

RSpec.describe Document, type: :model, elasticsearch: true do
  let(:john) {create(:user)}

  subject { create(:document, user: john)}

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is invalid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end
  it 'is invalid without a user' do
    subject.user = nil
    expect(subject).not_to be_valid
  end
  it 'is invalid without a generated date' do
    subject.generated_date = nil
    expect(subject).not_to be_valid
  end
  it 'is invalid without a url' do
    subject.url = nil
    expect(subject).not_to be_valid
  end
  it 'is invalid without a origin' do
    subject.origin = nil
    expect(subject).not_to be_valid
  end
end
