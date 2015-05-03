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

  def wrap(content)
    sanitize((content.split.map{ |s| wrap_long_string(s) }.join(' ')).html_safe)
  end

  def split_str(str, len = 10)
    fragment = /.{#{len}}/
    str.split(/(\s+)/).map! { |word|
      (/\s/ === word) ? word : word.gsub(fragment, '\0<wbr />&shy;')
    }.join
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  private

    def wrap_long_string(text, max_width = 10)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text :
                                  text.scan(regex).join(zero_width_space)
    end
end
