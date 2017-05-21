module ApplicationHelper
  def format_datetime(date_time)
    date_time.try(:strftime, '%d %b %Y %I:%M %p')
  end

  def comma_seperated_attachments_for(list, field = :file)
    list.collect do |attachment|
      link_to attachment.send("#{field}_file_name"), attachment.send(field).url, target: :_blank
    end.join(", ").html_safe
  end
end
