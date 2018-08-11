class Task < ApplicationRecord
	include PgSearch
		pg_search_scope :whose_description_starts_with,
		:against => :description,
		:using => {
		:tsearch => {:prefix => true}
		}

	belongs_to :user
	has_many :tomatoes, dependent: :delete_all
end
