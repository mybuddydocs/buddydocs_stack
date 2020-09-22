require 'rails_helper'

RSpec.describe "Connectors", type: :request do

  describe "GET /index" do
    context 'Controller global request' do
      it "returns http success" do
        get "/connectors/index"
        expect(response).to have_http_status(:success)
      end
    end
  end
end

