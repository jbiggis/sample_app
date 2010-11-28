module ApplicationHelper


def title


	base_title = "Ruby on Rails Tutorial Sample App"

	if @title
		base_title + " | " + @title
	else
		
		base_title
	end
end

def logo

  image_tag("logo.png", :alt => "Sample App", :class => "round") 

end

end
