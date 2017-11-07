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
      %w[H M S].map { |time| get_time(duration, time) }
    end

    def get_time(duration, target)
      items = duration.match(/[0-9]+#{target}/)
      items.blank? ? 0 : items.to_s.delete(target).to_i
    end
end
