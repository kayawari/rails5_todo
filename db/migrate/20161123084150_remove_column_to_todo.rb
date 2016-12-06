class RemoveColumnToTodo < ActiveRecord::Migration[5.0]
  def change
    remove_column :todos, :ins_time, :datetime
  end
end
