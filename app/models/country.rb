class Country < ApplicationRecord
	has_many :parks
	accepts_nested_attributes_for :parks

end
