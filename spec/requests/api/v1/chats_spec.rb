require "rails_helper"

describe "chats" do
  let(:room) { create(:room) }

  describe "GET /api/v1/chats" do
    let(:params) { { room_key: room.key } }
    let!(:chat) { create(:user_chat, room: room) }

    context "with valid params" do
      it "returns a chat", :autodoc do
        is_expected.to eq 200
        body = response.body
        expect(body).to be_json_eql(chat.id).at_path("chats/0/id")
      end
    end

    context "without room_key" do
      let(:params) { {} }

      it { is_expected.to eq 404 }
    end

    context "with invalid room_key" do
      let(:params) { { room_key: "invalid_key" } }

      it { is_expected.to eq 404 }
    end

    context "with cursor" do
      let!(:before_chat) { create(:user_chat, room: room) }
      let(:params) { { room_key: room.key, cursor: before_chat.id } }

      it "returns a chat", :autodoc do
        is_expected.to eq 200
        body = response.body
        expect(body).to be_json_eql(chat.id).at_path("chats/0/id")
      end

      it "dose not contain before_chat" do
        is_expected.to eq 200
        body = response.body
        expect(body).not_to have_json_path("chats/1/id")
      end
    end
  end
end
