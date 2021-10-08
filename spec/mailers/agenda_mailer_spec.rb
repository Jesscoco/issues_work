require "rails_helper"

RSpec.describe AgendaMailer, type: :mailer do
  describe "agenda_mail" do
    let(:mail) { AgendaMailer.agenda_mail }

    it "renders the headers" do
      expect(mail.subject).to eq("Agenda mail")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
