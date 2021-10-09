class TeamMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.team_mailer.team_mail.subject
  #
  def team_mail(owner,team)
    @owner = owner 
    @team= team.name
    mail to: owner.email
    
  end
end
