class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to action: :show
    else
      render action: :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(task_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  private

  def task_params
    params.require(:task)
      .permit(:title, :description, :tests)
  end
end


