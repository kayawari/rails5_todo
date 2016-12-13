class AddDuedateToTodos < ActiveRecord::Migration[5.0]
  def change
    add_column :todos, :duedate, :date
  end
end
