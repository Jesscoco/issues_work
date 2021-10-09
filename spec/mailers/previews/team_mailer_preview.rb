# Preview all emails at http://localhost:3000/rails/mailers/team_mailer
class TeamMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/team_mailer/team_mail
  def team_mail
    TeamMailer.team_mail
  end

end
