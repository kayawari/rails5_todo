class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.boolean :checked_flg
      t.string :title
      t.text :memo
      t.datetime :ins_time

      t.timestamps
    end
  end
end
