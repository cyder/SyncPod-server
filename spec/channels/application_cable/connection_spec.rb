require "rails_helper"

describe ApplicationCable::Connection, type: [:channel, :controller] do
  subject { connect path }

  context "with correct token" do
    let(:user) { create(:user) }
    let(:path) { "/cable?token=#{user.access_token}" }

    it "successfully connects" do
      subject
      expect(connection.current_user.id).to eq user.id
    end
  end

  context "with invalid token" do
    let(:path) { "/cable?token=invalid" }

    it { expect { subject }.to have_rejected_connection }
  end

  context "with empty token" do
    let(:path) { "/cable?token=" }

    it "successfully connects" do
      subject
      expect(connection.current_user).to eq nil
    end
  end
end
