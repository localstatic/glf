module ApplicationHelper
  def full_title(page_title)
    base_title = 'GLF Poll'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def place_name_link(place)
    if place.url.empty?
      place.name
    else
      link_to place.name, place.url, target: "_blank"
    end
  end

end
