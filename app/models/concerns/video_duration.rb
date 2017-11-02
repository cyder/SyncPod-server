class VideoDuration
  def initialize(duration)
    @time = Tod::TimeOfDay.new(*duration_to_array(duration))
  end

  def video_end_time(video_start_time)
    video_start_time.since(@time.second_of_day.seconds)
  end

  def text
    @time.strftime((@time.hour == 0) ? "%M:%S" : "%I:%M:%S")
  end

  private

    def duration_to_array(duration)
      duration.split(/[A-Z]/).
        map(&:to_i).
        last(3)
    end
end
