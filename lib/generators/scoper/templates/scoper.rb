<% module_namespacing do -%>
class <%= class_name %>Scoper < Scoper::Base
  
  def resolve
    scope
  end
  
end
<% end -%>