# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AliasedLinksController, type: :controller do
  let(:aliased_link_params) { { aliased_link: { long_url: 'http://google.ca' } } }

  describe 'before actions' do
    describe 'set_aliased_link' do
      it 'is expected to be defined before action' do
        is_expected.to use_before_action(:set_aliased_link)
      end
    end
  end

  describe 'GET index' do
    before { get :index }

    it { is_expected.to respond_with(:success) }
  end

  describe 'POST create' do
    before { post :create, params: aliased_link_params }

    context 'when save is successful' do
      let(:success) { true }
      it { is_expected.to redirect_to root_path }
    end
  end

  describe 'GET show' do
    before { get :show, params: { token: 'test123' } }

    context 'should redirect to long url' do
      it { is_expected.to redirect_to 'http://test.host/' }
    end
  end
end
