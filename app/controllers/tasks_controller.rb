class TasksController < ApplicationController
  # GET /tasks
  def index
    user_id = params[:user_id]

    if user_id.present?
      @tasks = Task.where(user_id: user_id)
      render json: @tasks
    else
      render json: { error: 'User ID is required' }, status: :unprocessable_entity
    end
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.user_id = params[:user_id] # Set user_id from params

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PUT /tasks/:id
  def update
    task = Task.find_by(id: params[:id])

    if task.update(task_params)
      render json: task, status: :ok
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/:id
  def destroy
    task = Task.find_by(id: params[:id])

    if task
      task.destroy
      render json: { message: 'Task deleted successfully' }, status: :ok
    else
      render json: { error: 'Task not found' }, status: :not_found
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :completed)
  end
end
