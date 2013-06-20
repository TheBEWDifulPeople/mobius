module HomeHelper
	def convert_to_tag_link(tag_list)
		if tag_list == nil
      tag_list = []
    else
  		tag_list.map do |tag|
  			link_to "#{tag}", Category.find_by(name: tag)
  		end.join(", ").html_safe
    end
	end

	def convert_to_list(tag_list)
		if tag_list == nil
      tag_list = []
    else
      tag_list.join(", ")
    end
	end
end
