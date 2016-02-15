require "rails_helper"

describe FeedbackDecorator do
  let(:user) { User.new(full_name: "Name", email: "user@example.com") }
  let(:feedback) { build(:feedback, user: user) }

  subject { described_class.new(feedback) }

  its(:author) { is_expected.to eq user.full_name }
  its(:email) { is_expected.to eq user.email }

  context "when there is no user" do
    let(:user) { nil }

    its(:author) { is_expected.to eq "" }
    its(:email) { is_expected.to eq "" }
  end
end
