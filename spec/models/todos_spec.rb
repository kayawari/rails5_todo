require 'rails_helper'

describe Todo do
  describe 'Model' do
    it "is valid with a checked_flg, title, memo, duedate" do
      todo = Todo.new(
        checked_flg: false,
        title: 'sample title',
        memo: 'sample メモ',
        duedate: 1991-10-20)
      expect(todo).to be_valid
    end

    it "is invalid without title" do
      todo = Todo.new(checked_flg: false, title: nil)
      todo.valid?
      expect(todo.errors[:title]).to include("can't be blank")
    end
    
    it "is valid with blank memo" do
      todo = Todo.new(checked_flg: false, title:'sample', memo: nil)
      expect(todo).to be_valid
    end
  end
end
