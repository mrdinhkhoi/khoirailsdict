module ApplicationHelper
  

def link_to_add_fields(name, f, type)
  new_object = f.object.send "build_#{type}"
  id = "new_#{type}"
  fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
    render(type.to_s + "_fields", f: builder)
  end
  link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
end

def full_title(page_title = '')
    base_title = "Rails Dict"
    if page_title.empty?
      base_title
    else
      page_title + " - " + base_title
    end
  end

end
