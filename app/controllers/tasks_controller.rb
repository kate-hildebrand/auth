class TasksController < ApplicationController
  def index
    @tasks = Task.where({ "user_id" => @current_user["id"]})
    @task = Task.new
  end

  def create
    @task = Task.new
    @task["description"] = params["task"]["description"]
    @task["user_id"] = @current_user["id"]
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    if @task["user_id"] == @current_user["id"]
    @task.destroy
    end
    redirect_to "/tasks"
  end
end
