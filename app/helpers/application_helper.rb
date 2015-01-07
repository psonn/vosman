module ApplicationHelper

  def link_out(path)
    link_to "#{name}", path, target: "_blank"
  end
end
