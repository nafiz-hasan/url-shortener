# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InfosController, type: :controller do
  let!(:aliased_link) { create(:aliased_link) }
  let!(:info) { create(:info, aliased_link: aliased_link) }

  describe 'before actions' do
    describe 'set_aliased_link' do
      it 'is expected to be defined before action' do
        is_expected.to use_before_action(:set_aliased_link)
      end
    end
  end

  describe 'GET #index' do
    before do
      allow(aliased_link.infos).to receive(:create)
      get :index, params: { token: aliased_link.token }
    end
    it { is_expected.to respond_with 200 }
  end
end
