class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)

    if @task.save
      flash[:success] = 'New task was created'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'New task was not created'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'Task was updated'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task was not updated'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:success] = 'Task was destroyed'
      redirect_to tasks_path
    else
      flash[:failure] = 'Task was not destroyed'
      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.required(:task).permit(:name, :status, :creator, :completed, :description, :performer)
  end
end
