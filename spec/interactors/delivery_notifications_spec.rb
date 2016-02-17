require "rails_helper"

describe DeliveryNotifications do
  let(:feedback_attributes) { FactoryGirl.attributes_for(:feedback).merge(user: create(:user)) }
  let(:mailer_double) { double }
  let(:client_double) { double("HipChat::Client") }
  let(:room_double) { double() }

  subject(:call) { described_class.call(feedback_attributes) }

  before do
    allow(ApplicationMailer).to receive(:feedback).and_return(mailer_double)
    allow(mailer_double).to receive(:deliver_now!).and_return("YES SIR!")
    allow(HipchatClient).to receive(:connect).and_return(:client_double)
    allow(client_double).to receive(:[]).with(described_class::ROOM).and_return(room_double)
    allow(room_double).to receive(:send).and_return("ding dong!")
  end

  it "sends email and HipChat notifications" do
    expect(ApplicationMailer).to receive(:feedback).and_return(mailer_double)
    expect(mailer_double).to receive(:deliver_now!).and_return("YES SIR!")

    expect(HipchatClient).to receive(:connect).and_return(client_double)
    expect(client_double).to receive(:[]).with(described_class::ROOM).and_return(room_double)
    expect(room_double).to receive(:send).and_return("ding dong!")

    call
  end
end
