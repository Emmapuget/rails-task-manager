class TasksController < ApplicationController
  before_action :task_find, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(strong_param)
    if @task.save!
      redirect_to @task
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(strong_param)
      redirect_to @task
    else
      render :index
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path
    end
  end

  private

  def task_find
    @task = Task.find(params[:id])
  end

  def strong_param
    params.require(:task).permit(:title, :details, :completed)
  end
end
