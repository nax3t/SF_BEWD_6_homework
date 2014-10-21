class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :votes, dependent: :destroy
	validates :title, presence: true,
                    length: { minimum: 5 }
  validates :link, :format => URI::regexp(%w(http https))
end
