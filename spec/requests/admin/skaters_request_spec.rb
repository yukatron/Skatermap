require 'rails_helper'

RSpec.describe "Skaters", type: :request do
	describe 'スケーター一覧ページ' do
		context "スケーター一覧ページが正しく表示される" do 
			before do
				get skaters_path
			end
			it 'リクエストは200 okとなること' do
				expect(response.status).to eq 200
			end
		end
	end
end