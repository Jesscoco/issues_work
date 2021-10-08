class AgendaMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.agenda_mailer.agenda_mail.subject
  #
  def agenda_mail(user, agenda)
    @agenda = agenda

    mail to: user.email
  end
end
