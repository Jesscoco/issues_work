# Preview all emails at http://localhost:3000/rails/mailers/agenda_mailer
class AgendaMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/agenda_mailer/agenda_mail
  def agenda_mail
    AgendaMailer.agenda_mail
  end

end
