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
  end
end
