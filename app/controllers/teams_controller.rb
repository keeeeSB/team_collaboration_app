class TeamsController < ApplicationController
  before_action :require_login

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "チームを作成しました。"
      redirect_to @team
    else
      flash.now[:danger] = "チームを作成できませんでした。"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  private

    def team_params
      params.require(:team).permit(:name)
    end
end
