require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Clays', type: :request do
  context 'when creating a clay' do
    let(:test_clay) { build(:clay) }

    context 'when all required data is provided' do
      it "creates a clay and redirect to clay's page" do
        get '/clays/new'
        expect(response).to render_template(:new)

        post '/clays',
             params: {
               clay: test_clay.attributes
             }

        expect(response).to redirect_to(assigns(:clay))
        follow_redirect!

        expect(response).to render_template(:show)
        expect(response.body).to include(test_clay.name)
      end
    end

    context 'when required data is missing' do
      it 're-renders new view when missing required fields' do
        test_clay.name = nil
        test_clay.brand_name = nil

        get '/clays/new'
        expect(response).to render_template(:new)

        post '/clays',
             params: {
               clay: test_clay.attributes
             }

        expect(response).to render_template(:new)
      end
    end
  end

  context 'when editing a clay' do
    let(:test_clay) { create(:clay) }

    context 'when all required data is provided' do
      it "edits and redirects to clay's page" do
        test_clay.name = 'Hello World'

        get "/clays/#{test_clay.id}/edit"
        expect(response).to render_template(:edit)

        put "/clays/#{test_clay.id}",
            params: {
              clay: test_clay.attributes
            }

        expect(response).to redirect_to(assigns(:clay))
        follow_redirect!

        expect(response).to render_template(:show)
        expect(response.body).to include('Hello World')
      end
    end

    context 'when required data is missing' do
      it 're-renders edit view when missing required fields' do
        test_clay.name = nil
        test_clay.brand_name = nil

        get "/clays/#{test_clay.id}/edit"
        expect(response).to render_template(:edit)

        put "/clays/#{test_clay.id}",
            params: {
              clay: test_clay.attributes
            }

        expect(response).to render_template(:edit)
      end
    end
  end

  context 'when destorying a clay' do
    let!(:test_clay) { create(:clay, name: 'My Cool Clay') }

    it 'destroys and redirects to clays index' do
      get clays_path
      expect(response).to render_template(:index)
      expect(response.body).to include('My Cool Clay')

      delete "/clays/#{test_clay.id}"

      expect(response).to redirect_to(clays_path)
      follow_redirect!

      expect(response).to render_template(:index)
      expect(response.body).to_not include('My Cool Clay')
    end
  end
end
# rubocop:enable Metrics/BlockLength
