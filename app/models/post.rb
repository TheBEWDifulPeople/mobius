class Post < ActiveRecord::Base
	validates :img_url, :quoted_from, presence: true
	validates :img_url, format: {with:  /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/ix}

	has_many :comments
	has_many :tags
	has_many :categories, through: :tags
	belongs_to :user

	def self.search_for(query)
		where('img_url LIKE :search_query OR quoted_from LIKE :search_query', search_query: "%#{query}%")
	end

	def tag_list
		self.categories.pluck(:name)
	end

	# def tag_list=(tags)
	# 	tags.split(", ").each do |tag|
	# 	    self.categories << Category.where(name: tag).first_or_create
	# 	end
	# end

	def tag_list=(tags)
		tags = tags.split(/,\s*/)

		tags.each do |tag|
			unless self.categories.find_by name: tag
				self.categories << Category.where(name: tag).first_or_create
			end
		end
		self.categories.where.not(name: tags).destroy_all
	end

end
