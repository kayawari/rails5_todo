class AddTodosToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :todo, foreign_key: true
  end
end
