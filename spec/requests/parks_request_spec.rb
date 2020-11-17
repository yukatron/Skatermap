require 'rails_helper'

RSpec.describe "Parks", type: :request do
	describe 'パーク詳細ページ' do
		context "地図が正しく表示される" do
			before do
				get parks_path
			end
			it 'リクエスト200 OKとなる' do
				expect(response.status).to eq 200
			end
		end
	end
end