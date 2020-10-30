require 'rails_helper'

RSpec.describe "Admin::Skaters", type: :request do
	describe 'アカウント一覧ページ' do
		before do
			get admin_skaters_path
		end
		it 'リクエストは200 OKとなる' do
			expect(response.status).to eq 302
		end
		it 'アカウント一覧が正しく表示される' do
			expect(response.body).to include("アカウント一覧")
		end
	end
end