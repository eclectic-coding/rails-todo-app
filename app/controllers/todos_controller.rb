class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.create(todo_params)
    if @todo.save
      flash[:notice] = 'Todo was created successfully'
      redirect_to todo_path(@todo)
    else
      # failure case
      render 'new'
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash[:notice] = 'Todo was successfully deleted'
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end
