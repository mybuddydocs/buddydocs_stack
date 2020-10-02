require 'rails_helper'
require 'pry-byebug'

RSpec.describe DocumentsController, type: :controller do

  describe "GET #index" do
    let(:laetitia) {create(:user)}
    let(:john) {create(:user)}

    let(:valid_attributes) {{name: "test", user: laetitia, url: "www.test.fr", generated_date: "Sept. 29, 2020", origin: "test"}}
    let(:valid_attributes2) {{name: "test", user: laetitia, url: "www.test.fr", generated_date: "Sept. 29, 2020", origin: "test"}}
    let(:valid_attributes3) {{name: "test", user: john, url: "www.test.fr", generated_date: "Sept. 29, 2020", origin: "test"}}
    let(:valid_session) {{}}
    it 'it works' do
      Document.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
      expect(response).to render_template("index")
    end

    it 'returns only documents linked to the user' do
      Document.create! valid_attributes
      Document.create! valid_attributes2
      Document.create! valid_attributes3
      expect(Document.all.length).to eq(3)
      expect(laetitia.documents.all.length).to eq(2)
      expect(john.documents.all.length).to eq(1)
    end
  end
end
