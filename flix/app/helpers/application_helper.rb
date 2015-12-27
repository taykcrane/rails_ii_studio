module ApplicationHelper
	def page_title
		if content_for?(:title)
			"Flix - #{content_for(:title)}"
		else
			"Flix"
		end
	end

	def nav_link_to(text, path)
		classes = ["button"]
		if current_page?(path)
			classes << "active"
		end
		link_to text, path, class: classes.join(" ")
	end
end
