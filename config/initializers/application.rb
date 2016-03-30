# Do not create a new <div> when form field is invalid.
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
   html_tag
end