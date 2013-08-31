module ApplicationHelper
  def full_title(page_title)
    base_title = 'GLF Poll'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def place_name(place, options = nil)
    options = {} if options.nil?
    str = place.name

    place.url.strip!
    unless place.url.empty?
      if options[:name_as_link]
        str = link_to str, place.url, target: "_blank"
      else
        str += " (#{link_to "website", place.url, target: "_blank"})"
      end
    end

    if place.disabled?
      str += ' <span class="text-warning">[DISABLED]</span>'
    end

    if place.description.present?
      omission = "<span title=\"#{place.description}\"> ...</span>"
      str += "<span class=\"description\"> - #{place.description.truncate(50 + omission.length - place.description.length, separator: " ", omission: omission)}"
    end

    raw str
  end

end
