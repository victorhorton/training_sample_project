module ApplicationHelper
  def human_readable_duration(seconds)
    if seconds.nil?
      nil
    elsif seconds >= 3600
      Time.at(seconds).utc.strftime("%H:%M:%S")
    else
      Time.at(seconds).utc.strftime("%M:%S")
    end
  end
end
