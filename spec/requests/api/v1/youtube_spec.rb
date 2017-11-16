require "rails_helper"

describe "room" do
  let(:user) { create(:user) }
  let(:headers) { { "Authorization" => user.access_token } }

  describe "GET /api/v1/youtube/search" do
    let(:keyword) { "キーワード" }
    let(:page_token) { "CAoQAA" }

    context "with valid params" do
      let(:params) { { keyword: keyword } }
      it "returns a search results", :autodec do
        is_expected.to eq 200
        body = response.body
        expect(body).to have_json_path("items")
        expect(body).to have_json_path("next_page_token")
      end

      it "returns videos" do
        is_expected.to eq 200
        body = response.body
        expect(body).to have_json_path("items/0/youtube_video_id")
        expect(body).to have_json_path("items/0/title")
      end
    end

    context "with page token params" do
      let(:params) { { keyword: keyword, page_token: page_token } }
      it "returns a search results", :autodec do
        is_expected.to eq 200
        body = response.body
        expect(body).to have_json_path("items")
        expect(body).to have_json_path("next_page_token")
      end
    end

    context "with invalid params" do
      it "returns a error" do
        is_expected.to eq 400
        body = response.body
        expect(body).to have_json_path("error")
      end
    end
  end

  describe "GET /api/v1/youtube/video" do
    let(:id) { "PqJNc9KVIZE" }

    context "with valid params" do
      let(:params) { { id: id } }
      it "returns a video", :autodec do
        is_expected.to eq 200
        body = response.body
        expect(body).to be_json_eql(%("#{id}")).at_path("youtube_video_id")
        expect(body).to have_json_path("title")
      end
    end

    context "with invalid params" do
      it "returns a error" do
        is_expected.to eq 400
        body = response.body
        expect(body).to have_json_path("error")
      end
    end
  end
end
