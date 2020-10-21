require 'rails_helper'
require 'pry-byebug'

RSpec.describe DocumentsController, type: :controller do

  describe "GET #index" do
    let(:laetitia) { create(:user) }
    let(:documents) { create_list(:document, 5, user: laetitia) }
    it 'should get index' do
      sign_in laetitia
      get :index

      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end
    it 'should list all documents' do
      sign_in laetitia
      redirect_to documents_path

      documents.each do |document|
        expect(document.name).to be_truthy
      end
    end
  end
end
