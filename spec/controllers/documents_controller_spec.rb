require 'rails_helper'
require 'pry-byebug'

RSpec.describe DocumentsController, type: :controller do

  context "with user logged in" do
    describe "GET #index" do
      login_user
      let(:john) {create(:user)}

      let(:valid_attributes) {{name: "test", user: @user, url: "www.test.fr", date: "Sept. 29, 2020", origin: "test"}}
      let(:valid_attributes2) {{name: "test", user: @user, url: "www.test.fr", date: "Sept. 29, 2020", origin: "test"}}
      let(:valid_attributes3) {{name: "test", user: john, url: "www.test.fr", date: "Sept. 29, 2020", origin: "test"}}
      let(:valid_session) {{}}
      it 'returns a success response' do
        Document.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
      it 'returns all the document linked to the user' do
        Document.create! valid_attributes
        Document.create! valid_attributes2
        Document.create! valid_attributes3
        expect(Document.all.length).to eq(3)
        expect(@user.documents.all.length).to eq(2)
        expect(john.documents.all.length).to eq(1)
      end
    end
  end
end
