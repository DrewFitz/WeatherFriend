class User < ApplicationRecord
	validates :name, uniqueness: true
	has_many :locations
end
