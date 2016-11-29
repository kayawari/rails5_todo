class RemoveColumnToTodo < ActiveRecord::Migration[5.0]
  def change
    remove_columns :todo, :ins_time, :datetime
  end
end
