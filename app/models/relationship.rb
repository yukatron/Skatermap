class Relationship < ApplicationRecord
	belongs_to :skater
  	belongs_to :follow, class_name: 'Skater'

  	validates :skater_id, presence: true
  	validates :follow_id, presence: true
end
