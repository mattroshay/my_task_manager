class TasksController < ApplicationController
  def index
    render json: Task.all
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: task
    else
      render json: {error: 'Failed to create task'}, status: :unprocessable_entity
    end
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      render json: task
    else
      render json: {error: 'Failed to update task'}, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
