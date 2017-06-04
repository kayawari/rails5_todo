include ApplicationHelper

class TodosController < ApplicationController
  def index
    redirect_to login_path, alert: 'ログインしてください' unless logged_in?

    @todos = Todo.where(user_id: session[:user_id])
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def edit
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.checked_flg = false
    @todo.user_id = session[:user_id]

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_url, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check
    @todo = Todo.find(params[:id])

    if @todo.update_attributes(checked_flg: params[:checked_flg])
    else
      puts 'error'
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :memo, :duedate)
  end
end
