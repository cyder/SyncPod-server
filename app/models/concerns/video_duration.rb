class VideoDuration
  def initialize(duration)
    @time = Tod::TimeOfDay.new(*duration_to_array(duration))
  end

  def video_end_time(video_start_time)
    video_start_time.since(@time.second_of_day.seconds)
  end

  def text
    @time.strftime((@time.hour == 0) ? "%-M:%S" : "%-I:%M:%S")
  end

  private

    def duration_to_array(duration)
      hour = get_time(duration, "H")
      min = get_time(duration, "M")
      sec = get_time(duration, "S")
      [hour, min, sec]
    end

    def get_time(duration, target)
      regexp = Regexp.new("[0-9]+" + target)
      items = duration.match(regexp)
      items.blank? ? 0 : items[0].delete(target).to_i
    end
end
