class Park < ApplicationRecord
	belongs_to :country
	has_many :posts

	has_many_attached :images

	geocoded_by :address
	after_validation :geocode, if: :address_changed?

	validates :name, presence: true
	validates :address, presence: true
end
