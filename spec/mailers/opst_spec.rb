require "rails_helper"

RSpec.describe OpstMailer, type: :mailer do
  describe "closing" do
    let(:mail) { OpstMailer.closing }

    it "renders the headers" do
      expect(mail.subject).to eq("Closing")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
