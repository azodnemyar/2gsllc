module ApplicationHelper
  
  def link_to_add_fields(name, f, association, child_association = nil)
      new_object = f.object.send(association).klass.new
      
      if child_association
        1.times{ new_object.build_attachment }
      end
      
      id = new_object.object_id
      
      add_new = content_tag(:i, "", class: "icon-plus")
      
      fields = f.fields_for(association, new_object, child_index: id) do |builder|
        render(association.to_s.singularize + "_fields", f: builder)
      end
      link_to name, class: "btn btn-xs green add_fields", data: {id: id, fields: fields.gsub("\n", "")} do
        add_new
      end
    end
    
end
