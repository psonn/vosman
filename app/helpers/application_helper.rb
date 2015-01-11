module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Ineke Vosman"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def back_to(path)
    link_to("&laquo; Terug".html_safe, path, :class => 'btn btn-default')
  end
end
