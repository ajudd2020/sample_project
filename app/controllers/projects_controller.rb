class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    updated_params = {
      title: project_params[:title],
      budget: project_params[:budget].to_i,
      start_date: Date.parse(project_params[:start_date])
    }

    @project = Project.new(updated_params)

    if @project.save
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to root_path, status: :see_other
  end


  private
    def project_params
      params.require(:project).permit(:title, :budget, :start_date)
    end
end
