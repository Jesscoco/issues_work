class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: %i[show edit update destroy]

  def index
    @teams = Team.all
  end

  def show
    @working_team = @team
    change_keep_team(current_user, @team)
  end

  def new
    @team = Team.new
  end

  def edit
   
  end

  def create
    @team = Team.new(team_params)
    @team.owner = current_user
    if @team.save
      @team.invite_member(@team.owner)
      redirect_to @team, notice: I18n.t('views.messages.create_team')
    else
      flash.now[:error] = I18n.t('views.messages.failed_to_save_team')
      render :new
    end
  end

  def update
    if current_user == @team.owner 

      if @team.update(team_params)
         redirect_to @team, notice: I18n.t('views.messages.update_team')
      else
          flash.now[:error] = I18n.t('views.messages.failed_to_save_team')
          render :edit
      end
    else
      redirect_to @team, notice: I18n.t('views.messages.failed_to_update')
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, notice: I18n.t('views.messages.delete_team')
  end

  def give_authority
    @user= User.find(params[:member_id])  
    @team = Team.find(params[:team_id])
    @old_leader= User.find(@team.owner_id)  
    @old_leader.update(keep_team_id: nil)
    @team.update(owner_id: @user.id)
    @user.update(keep_team_id: @team.id)
    redirect_to team_path(@team.id)
  end

  def dashboard
    @team = current_user.keep_team_id ? Team.find(current_user.keep_team_id) : current_user.teams.first
  end

  private

  def set_team
    @team = Team.friendly.find(params[:id])
  end

  def team_params
    params.fetch(:team, {}).permit %i[name icon icon_cache owner_id keep_team_id]
  end
end
