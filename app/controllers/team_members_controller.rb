class TeamMembersController < ApplicationController
  before_action :require_login

  def create
    team = Team.find(params[id])
    team_member = current_user.TeamMember.build(team_id: team.id)
    if team_member.save
      flash[:success] = "チームに参加しました。"
      redirect_to team_path(team)
    else
      flash.now[:danger] = "チームに参加できませんでした。"
      render team_path(team)
    end
  end

  def destroy
    
  end
end
