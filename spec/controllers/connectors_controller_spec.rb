require 'rails_helper'

RSpec.describe ConnectorsController, type: :controller do

  describe "When user is logged in" do
    let(:valid_attributes1) {{name: "test1", url: "www.test1.fr"}}
    let(:valid_attributes2) {{name: "test2", url: "www.test2.fr"}}
    let(:valid_attributes3) {{name: "test3", url: "www.test2.fr", available: false}}
    let(:valid_session) {{}}
    context "GET #index" do
      before do
        Connector.create! valid_attributes1
        Connector.create! valid_attributes2
        Connector.create! valid_attributes3
      end
    it 'it works' do
      Connector.create! valid_attributes1
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
      expect(response).to render_template("index")
    end
      it 'display all connectors available' do
        expect(Connector.all.length).to eq(3)
        expect(Connector.where(available: true).length).to eq(2)
      end
    end
  end
end
