class PledgesController < ApplicationController
  before_action :lookup_project

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)

    @pledge.try_to_set_funding_level(@project.funding_levels)

    if @pledge.save
      redirect_to project_path(@project), notice: 'Created a pledge!!'
    else
      render 'new'
    end
  end

  private

  def pledge_params
    params.require(:pledge).permit(:name, :email, :amount, :funding_level_id)
  end

  def lookup_project
    @project = Project.find(params[:project_id])
  end
end
