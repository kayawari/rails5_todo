class AddIndexToUsersEmail < ActiveRecord::Migration[5.0]
  
  # activerecordレベルでは二度押しなどで一意性を担保できない場合があるので、
  # emailカラムにインデックスを追加
  def change
    add_index :users, :email, unique: true
  end
end
