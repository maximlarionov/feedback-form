require "rails_helper"

describe HipchatInteractor::Organizer do
  let(:params) do
    {
      email: "makcimka1994@gmail.com",
      name: "Max L",
      message: "1337",
      phone: "+79991560391"
    }
  end

  let(:call) { described_class.call(params) }

  before do
    allow_any_instance_of(HipchatInteractor::Connector).to receive(:call)
    allow_any_instance_of(HipchatInteractor::Messenger).to receive(:call)
  end

  it "calls HipchatInteractor::Connector and HipchatInteractor::Messenger" do
    expect_any_instance_of(HipchatInteractor::Connector).to receive(:call)
    expect_any_instance_of(HipchatInteractor::Messenger).to receive(:call)

    call
  end
end
