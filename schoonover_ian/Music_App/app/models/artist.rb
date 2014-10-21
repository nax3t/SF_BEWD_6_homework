class Artist < ActiveRecord::Base
	belongs_to :label
	has_many :songs, dependent: :destroy
end
