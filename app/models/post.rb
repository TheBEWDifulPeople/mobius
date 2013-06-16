class Post < ActiveRecord::Base
	validates :img_url, :quoted_from, presence: true
	validates :img_url, format: {with:  /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/ix}

	def self.search_for(query)
		where('img_url LIKE :search_query OR quoted_from', search_query: "%#{query}%")
	end
end
