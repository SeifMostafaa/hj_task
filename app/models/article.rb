class Article < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true

	def self.get_title(query)
    where('title LIKE ?', "%#{query}%").pluck(:title, :id).first(10) if exists?
  end
end
