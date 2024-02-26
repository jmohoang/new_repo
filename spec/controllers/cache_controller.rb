# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CacheController, type: :controller do
  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'caches the current time' do
      Rails.cache.clear # Clear the cache before the test
      get :index
      expect(assigns(:current_time)).to be_nil # Ensure the cache is initially empty

      get :index
      expect(assigns(:current_time)).not_to be_nil # Expect the cache to be populated

      Rails.cache.clear # Clear the cache after the test
    end
  end
end
