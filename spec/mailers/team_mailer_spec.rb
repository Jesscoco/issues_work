require "rails_helper"

RSpec.describe TeamMailer, type: :mailer do
  describe "team_mail" do
    let(:mail) { TeamMailer.team_mail }

    it "renders the headers" do
      expect(mail.subject).to eq("Team mail")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
