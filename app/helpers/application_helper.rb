module ApplicationHelper
  def format_datetime(date_time)
    date_time.try(:strftime, '%d %b %Y %I:%M %p')
  end
end
