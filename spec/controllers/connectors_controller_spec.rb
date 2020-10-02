require 'rails_helper'

RSpec.describe ConnectorsController, type: :controller do

  let(:connectors) {create_list(:connector, 10)}
  let(:laetitia) {create(:user)}
  describe "GET #index" do
  it 'it works' do
    get :index
    expect(response).to be_successful
    expect(response).to render_template("index")
  end
    it 'should list all connectors' do
      sign_in laetitia
      redirect_to connectors_path

      connectors.each do |connector|
        expect(connector.name).to be_truthy
      end
    end
  end
end
