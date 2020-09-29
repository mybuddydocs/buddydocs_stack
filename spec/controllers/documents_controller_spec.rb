require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do

  context "with user logged in" do
    describe "GET #index" do
      login_user

      let(:valid_attributes) {{name: "test", user: @user}}
      let(:valid_session) {{}}
      it 'returns a success response' do
        Document.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end
  end
end
