require 'rails_helper'

RSpec.describe "Admin::Session", type: :request do
	describe '管理人ログインページ' do
		before do
			get new_admin_session_path
			fill_in 'email', with: 'admin@mail.com'
			fill_in 'password', with: 'adminadmin'
			click_button 'ログイン'
		end
		it 'アカウント一覧へ遷移する' do
			expect(page).to have_content 'アカウント一覧'
		end
	end
end