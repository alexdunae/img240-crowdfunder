class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order('created_at DESC')
  end

  def show
    @project = Project.find(params[:id])
    @pledge = Pledge.new
  end
end
