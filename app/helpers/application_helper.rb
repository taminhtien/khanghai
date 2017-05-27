module ApplicationHelper
  def format_datetime(date_time)
    date_time.try(:strftime, '%d %b %Y %I:%M %p')
  end

  def comma_seperated_attachments_for(list, field = :file)
    list.collect do |attachment|
      link_to attachment.send("#{field}_file_name"), attachment.send(field).url, target: :_blank
    end.join("<div></div>").html_safe
  end

  def comma_seperated_for(list, field = :title)
    list.pluck(field).join(", ") unless list.empty?
  end

  def admin_comma_seperated_links_for(list, field = :title)
    collection = []
    list.collect do |item|
      value = item.send(field)
      if !value.blank?
        collection << link_to(value, [:admin, item])
      end
    end
    collection.join(", ").html_safe
  end
end
