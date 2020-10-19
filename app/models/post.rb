class Post < ApplicationRecord
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	belongs_to :skater
	belongs_to :park

	has_one_attached :video
end
