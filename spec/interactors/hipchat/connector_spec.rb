require "rails_helper"

describe HipchatInteractor::Connector do
  let(:call) { described_class.call }

  before do
    stub_const("HipchatInteractor::Connector::TOKEN", "123456")
    allow(HipChat::Client)
      .to receive(:new)
      .with("123456", api_version: 'v2', server_url: 'https://fs.hipchat.com')
  end

  it "authenticates to Hipchat" do
    expect(HipChat::Client).to receive(:new)

    call
  end
end
