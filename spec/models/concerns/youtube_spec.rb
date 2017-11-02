require "rails_helper"
require "google/apis/youtube_v3"

describe Youtube do
  describe "#initialize" do
    let(:youtube_video_id) { "XVId6EOnKq4" }
    let(:youtube) { Youtube.new(youtube_video_id) }

    let(:channel_title) { "ポルカドットスティングレイ" }
    let(:published) { DateTime.parse("Wed, 01 Nov 2017 02:59:48 +0000").utc }
    let(:thumbnail_url) { "https://i.ytimg.com/vi/XVId6EOnKq4/mqdefault.jpg" }
    let(:title) { "ポルカドットスティングレイ「全知全能」トレーラー" }

    context "when video is exist" do
      it { expect(youtube.channel_title).to eq channel_title }
      it { expect(youtube.published).to eq published }
      it { expect(youtube.thumbnail_url).to eq thumbnail_url }
      it { expect(youtube.title).to eq title }
    end
  end
end
