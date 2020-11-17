require 'rails_helper'

RSpec.describe Park, type: :model do
	context "緯度経度が保存される" do
		before do
			@park = Park.new
			@park.address = '三重県松阪市山下町１１１'
			@park.name = '松阪市総合運動公園スケートパーク'
			@park.country_id = 1
		end
		it "緯度経度も保存される" do
			expect(@park).to include("@park.latitude")
		end
	end
end