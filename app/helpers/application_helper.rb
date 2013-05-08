module ApplicationHelper
  def full_title(page_title)
    base_title = 'GLF Poll'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def place_name_link(place, options = nil)
    options = {} if options.nil?
    str = place.name

    unless place.url.empty?
      if options[:name_as_link]
        str = link_to str, place.url, target: "_blank"
      else
        str += " (#{link_to "website", place.url, target: "_blank"})"
      end
    end

    raw str
  end

end
