require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Manufacturers', type: :request do
  context 'when creating a manufacturer' do
    let(:test_manufacturer) { build(:manufacturer) }

    context 'when all required data is provided' do
      it "creates a manufacturer and redirects to manufacturer's page" do
        get '/manufacturers/new'
        expect(response).to render_template(:new)

        post '/manufacturers',
             params: {
               manufacturer: test_manufacturer.attributes
             }

        expect(response).to redirect_to(assigns(:manufacturer))
        follow_redirect!

        expect(response).to render_template(:show)
        expect(response.body).to include(test_manufacturer.name)
      end
    end

    context 'when required data is missing' do
      it 're-renders new view when missing required fields' do
        test_manufacturer.name = nil
        test_manufacturer.description = nil

        get '/manufacturers/new'
        expect(response).to render_template(:new)

        post '/manufacturers',
             params: {
               manufacturer: test_manufacturer.attributes
             }

        expect(response).to render_template(:new)
      end
    end
  end

  context 'when editing a manufacturer' do
    let(:test_manufacturer) { create(:manufacturer) }

    context 'when all required data is provided' do
      it "edits and redirects to manufacturer's page" do
        test_manufacturer.name = 'Hello World'

        get "/manufacturers/#{test_manufacturer.id}/edit"
        expect(response).to render_template(:edit)

        put "/manufacturers/#{test_manufacturer.id}",
            params: {
              manufacturer: test_manufacturer.attributes
            }

        expect(response).to redirect_to(assigns(:manufacturer))
        follow_redirect!

        expect(response).to render_template(:show)
        expect(response.body).to include('Hello World')
      end
    end

    context 'when required data is missing' do
      it 're-renders edit view when missing required fields' do
        test_manufacturer.name = nil
        test_manufacturer.description = nil

        get "/manufacturers/#{test_manufacturer.id}/edit"
        expect(response).to render_template(:edit)

        put "/manufacturers/#{test_manufacturer.id}",
            params: {
              manufacturer: test_manufacturer.attributes
            }

        expect(response).to render_template(:edit)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
