class Park < ApplicationRecord

	belongs_to :country
	has_many :posts

	has_many_attached :images

	validates :name, presence: true
	validates :address, presence: true
	validates :country_id, presence: true

	geocoded_by :address
  	after_validation :geocode, if: :address_changed?

	scope :search, -> (search_params) do
		return if search_params.blank?
		name_like(search_params[:name])
	end
	scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }

	def to_param
    	return self.name
    	if admin_signed_in?
    		return self.id
    	end
  	end
end
