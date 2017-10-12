class VideoDuration
  def initialize(duration)
    @hour = get_time(duration, "H")
    @min = get_time(duration, "M")
    @sec = get_time(duration, "S")
  end

  def video_end_time(video_start_time)
    video_start_time + @sec + @min * 60 + @hour * 60 * 60
  end

  def text
    result = ""
    if @hour != 0
      result += @hour.to_s + ":"
      if @min < 10
        result += "0"
      end
    end
    result += @min.to_s + ":"
    if @sec < 10
      result += "0"
    end
    result += @sec.to_s
    result
  end

  private

    def get_time(duration, target)
      regexp = Regexp.new("[0-9]+" + target)
      items = duration.match(regexp)
      items.blank? ? 0 : items[0].delete(target).to_i
    end
end
