require "rails_helper"

describe HipchatClient do
  let(:call) { described_class.connect }

  before do
    stub_const("HipchatClient::TOKEN", "123456")
    allow(HipChat::Client)
      .to receive(:new)
      .with("123456", api_version: "v2", server_url: "https://fs.hipchat.com")
  end

  it "authenticates to Hipchat" do
    expect(HipChat::Client)
      .to receive(:new)
      .with("123456", api_version: "v2", server_url: "https://fs.hipchat.com")

    call
  end
end
