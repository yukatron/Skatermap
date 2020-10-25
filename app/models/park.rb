class Park < ApplicationRecord
	belongs_to :country, optional: true
	has_many :posts

	has_many_attached :images

	geocoded_by :address
	after_validation :geocode, if: :address_changed?

	validates :name, presence: true
	validates :address, presence: true


	scope :search, -> (search_params) do
		return if search_params.blank?
		name_like(search_params[:name])
	end
	scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }

	def to_param
    	return self.name
  	end
end
