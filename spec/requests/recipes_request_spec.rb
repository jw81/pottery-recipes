# require 'rails_helper'
#
# # rubocop:disable Metrics/BlockLength
# RSpec.describe 'Recipes', type: :request do
#   context 'when creating a recipe' do
#     let(:test_recipe) { build(:recipe) }
#
#     context 'when all required data is provided' do
#       it "creates a recipe and redirect to recipe's page" do
#         get '/recipes/new'
#         expect(response).to render_template(:new)
#
#         post '/recipes',
#              params: {
#                recipe: test_recipe.attributes
#              }
#
#         expect(response).to redirect_to(assigns(:recipe))
#         follow_redirect!
#
#         expect(response).to render_template(:show)
#         expect(response.body).to include(test_recipe.name)
#       end
#     end
#
#     context 'when required data is missing' do
#       it 're-renders new view when missing required fields' do
#         test_recipe.name = nil
#         test_recipe.brand_name = nil
#
#         get '/recipes/new'
#         expect(response).to render_template(:new)
#
#         post '/recipes',
#              params: {
#                recipe: test_recipe.attributes
#              }
#
#         expect(response).to render_template(:new)
#       end
#     end
#   end
#
#   context 'when editing a recipe' do
#     let(:test_recipe) { create(:recipe) }
#
#     context 'when all required data is provided' do
#       it "edits and redirects to recipe's page" do
#         test_recipe.name = 'Hello World'
#
#         get "/recipes/#{test_recipe.id}/edit"
#         expect(response).to render_template(:edit)
#
#         put "/recipes/#{test_recipe.id}",
#             params: {
#               recipe: test_recipe.attributes
#             }
#
#         expect(response).to redirect_to(assigns(:recipe))
#         follow_redirect!
#
#         expect(response).to render_template(:show)
#         expect(response.body).to include('Hello World')
#       end
#     end
#
#     context 'when required data is missing' do
#       it 're-renders edit view when missing required fields' do
#         test_recipe.name = nil
#         test_recipe.brand_name = nil
#
#         get "/recipes/#{test_recipe.id}/edit"
#         expect(response).to render_template(:edit)
#
#         put "/recipes/#{test_recipe.id}",
#             params: {
#               recipe: test_recipe.attributes
#             }
#
#         expect(response).to render_template(:edit)
#       end
#     end
#   end
#
#   context 'when destorying a recipe' do
#     let!(:test_recipe) { create(:recipe, name: 'My Cool Recipe') }
#
#     it 'destroys and redirects to recipes index' do
#       get recipes_path
#       expect(response).to render_template(:index)
#       expect(response.body).to include('My Cool Recipe')
#
#       delete "/recipes/#{test_recipe.id}"
#
#       expect(response).to redirect_to(recipes_path)
#       follow_redirect!
#
#       expect(response).to render_template(:index)
#       expect(response.body).to_not include('My Cool Recipe')
#     end
#   end
# end
# # rubocop:enable Metrics/BlockLength
