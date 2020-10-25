class Post < ApplicationRecord
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	belongs_to :skater
	belongs_to :park, optional: true

	has_one_attached :video

	validates :title, presence: true
	validates :skater_id, presence: true

	def favorited_by?(skater)
    	favorites.where(skater_id: skater.id).exists?
  	end

  	def to_param
    	return self.title
  	end
end
