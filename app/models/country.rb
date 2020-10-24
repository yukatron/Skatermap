class Country < ApplicationRecord
	has_many :parks
	accepts_nested_attributes_for :parks

	scope :search, -> (search_params) do
		return if search_params.blank?
		name_like(search_params[:name])
	end
	scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }

	validates :name, presence: true, uniqueness: true

end
