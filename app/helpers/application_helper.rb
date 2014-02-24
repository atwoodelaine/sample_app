module ApplicationHelper
	# Return a title on a per-page basis. 
	def title
	base_title = "Ruby on Rails"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end 

	def logo 
		image_tag("logo.png", :alt => "Sample_App", :class => "round")
		end 
	end
end
