class Post < ActiveRecord::Base
	validates :title, presence: true,
                    length: { minimum: 5 }
  validates_format_of :link, :with => URI::regexp(%w(http https))
end
