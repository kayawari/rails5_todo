include ApplicationHelper

class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    unless logged_in?
      redirect_to login_path, alert: 'ログインしてください'
    end

    @todos = Todo.where(user_id: session[:user_id])
    @user = session[:name]

    return @todos, @user
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

    # デフォルトでtodoはチェックが入っていない状態にする
    @todo.checked_flg = false
    @todo.user_id = session[:user_id]
    p @todo.user_id

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
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

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:checked_flg, :title, :memo, :duedate)
  end
end
