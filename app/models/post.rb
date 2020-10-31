class Post < ApplicationRecord
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	belongs_to :skater
	belongs_to :park, optional: true

	has_one_attached :video

	validates :title, presence: true, uniqueness: true
	validates :skater_id, presence: true

	def favorited_by?(skater)
    	favorites.where(skater_id: skater.id).exists?
  	end

  	def to_param
    	return self.title
    	if admin_signed_in?
    		return self.id
    	end
  	end
end
