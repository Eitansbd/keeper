ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    if html_tag.start_with?("<label")
      html_tag
    else
      text_area_fix = html_tag.start_with?("<textarea") ? "text-area-fix" : "".html_safe 
      html = "<div class=\"error-field #{text_area_fix}\">#{html_tag}".html_safe 
      html + "<small class=\"error-message\">#{instance.error_message.to_a.to_sentence}</small></div>".html_safe
    end
end