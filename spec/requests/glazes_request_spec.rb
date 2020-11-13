require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Glazes', type: :request do
  context 'when creating a glaze' do
    let(:test_glaze) { build(:glaze) }

    context 'when all required data is provided' do
      it "creates a glaze and redirect to glaze's page" do
        get '/glazes/new'
        expect(response).to render_template(:new)

        post '/glazes',
             params: {
               glaze: test_glaze.attributes
             }

        expect(response).to redirect_to(assigns(:glaze))
        follow_redirect!

        expect(response).to render_template(:show)
        expect(response.body).to include(test_glaze.name)
      end
    end

    context 'when required data is missing' do
      it 're-renders new view when missing required fields' do
        test_glaze.name = nil
        test_glaze.brand_name = nil

        get '/glazes/new'
        expect(response).to render_template(:new)

        post '/glazes',
             params: {
               glaze: test_glaze.attributes
             }

        expect(response).to render_template(:new)
      end
    end
  end

  context 'when editing a glaze' do
    let(:test_glaze) { create(:glaze) }

    context 'when all required data is provided' do
      it "edits and redirects to glaze's page" do
        test_glaze.name = 'Hello World'

        get "/glazes/#{test_glaze.id}/edit"
        expect(response).to render_template(:edit)

        put "/glazes/#{test_glaze.id}",
            params: {
              glaze: test_glaze.attributes
            }

        expect(response).to redirect_to(assigns(:glaze))
        follow_redirect!

        expect(response).to render_template(:show)
        expect(response.body).to include('Hello World')
      end
    end

    context 'when required data is missing' do
      it 're-renders edit view when missing required fields' do
        test_glaze.name = nil
        test_glaze.brand_name = nil

        get "/glazes/#{test_glaze.id}/edit"
        expect(response).to render_template(:edit)

        put "/glazes/#{test_glaze.id}",
            params: {
              glaze: test_glaze.attributes
            }

        expect(response).to render_template(:edit)
      end
    end
  end

  context 'when destorying a glaze' do
    let!(:test_glaze) { create(:glaze, name: 'My Cool Glaze') }

    it 'destroys and redirects to glazes index' do
      get glazes_path
      expect(response).to render_template(:index)
      expect(response.body).to include('My Cool Glaze')

      delete "/glazes/#{test_glaze.id}"

      expect(response).to redirect_to(glazes_path)
      follow_redirect!

      expect(response).to render_template(:index)
      expect(response.body).to_not include('My Cool Glaze')
    end
  end
end
# rubocop:enable Metrics/BlockLength
