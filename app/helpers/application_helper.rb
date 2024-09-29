module ApplicationHelper
  def timestap_duration(seconds)
    if seconds.nil?
      nil
    elsif seconds >= 3600
      Time.at(seconds).utc.strftime("%H:%M:%S")
    else
      Time.at(seconds).utc.strftime("%M:%S")
    end
  end

  def human_readable_duration(seconds)
    duration_parts = ActiveSupport::Duration.build(seconds).parts

    if seconds.nil?
      nil
    elsif seconds >= 3600
      "#{duration_parts[:hours]} hours, #{duration_parts[:minutes] || 0} minutes and #{duration_parts[:seconds] || 0} seconds"
    else
      "#{duration_parts[:minutes] || 0} minutes and #{duration_parts[:seconds] || 0} seconds"
    end
  end
end
