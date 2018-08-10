class Task < ApplicationRecord
	belongs_to :user
	has_many :tomatoes, dependent: :delete_all
end
