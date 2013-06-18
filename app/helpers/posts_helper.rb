module PostsHelper
	def convert_to_tag_link(tag_list)
		tag_list.map do |tag|
			link_to "#{tag}", Category.find_by(name: tag)
		end.join(", ").html_safe
	end

	def convert_to_list(tag_list)
		tag_list.join(", ")
	end
end
