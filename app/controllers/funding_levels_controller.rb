class FundingLevelsController < ApplicationController
  before_action :lookup_project

  def new
    @funding_level = @project.funding_levels.new
    # same as...
    # @funding_level = FundingLevel.new(project_id: @project.id)
  end

  def create
    @funding_level = @project.funding_levels.new(funding_level_params)

    if @funding_level.save
      redirect_to project_path(@project), notice: 'Created!'
    else
      render 'new'
    end
  end

  private

  def funding_level_params
    params.require(:funding_level).permit(:reward_name, :amount, :project_id)
  end

  def lookup_project
    @project = Project.find(params[:project_id])
  end
end
