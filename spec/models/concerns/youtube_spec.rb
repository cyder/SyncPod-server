require "rails_helper"
require "google/apis/youtube_v3"

describe Youtube do
  describe "#find" do
    subject { Youtube.find youtube_video_id }

    let(:youtube_video_id) { "AS4q9yaWJkI" }
    let(:youtube_video_title) { "ハチ MV「砂の惑星 feat.初音ミク」HACHI / DUNE ft.Miku Hatsune" }

    context "when video is exist" do
      it { expect(subject.id).to eq youtube_video_id }
      it { expect(subject.snippet.title).to eq youtube_video_title }
    end
  end
end
