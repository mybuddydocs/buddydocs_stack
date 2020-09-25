require 'rails_helper'

RSpec.describe "Connectors", type: :request do

  describe "GET /index" do
    context 'Controller global request' do
      it "returns http success" do
        get "/connectors/index"
        expect(response).to have_http_status(:success)
      end
      # it 'should display all connectors' do
      #   let(:connector) {Connector.new(url: "www.test.fr", name: "test")}
      #   expect(connector).to be_valid
      #   expect(Connector.all).to be >= 1
      # end
    end

  end
end

