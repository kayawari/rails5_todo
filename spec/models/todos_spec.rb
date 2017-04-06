require 'rails_helper'

describe Todo do
  describe 'Model' do

    it "is valid with a checked_flg, title, memo, duedate" do
      # duedateを今日の日付に変更
      todo = FactoryGirl.build(:todo, duedate:Date.today)
      expect(todo).to be_valid
    end

    it "is invalid without title" do
      todo = FactoryGirl.build(:todo, title:nil)
      todo.valid?
      expect(todo.errors[:title]).to include("can't be blank")
    end
    
    it "is valid with blank memo" do
      todo = FactoryGirl.build(:todo, memo: nil)
      # duedateを今日の日付に変更
      todo = FactoryGirl.build(:todo, duedate:Date.today)
      expect(todo).to be_valid
    end

    it "is invalid with duedate in the past" do
      todo = FactoryGirl.build(:todo)
      expect(todo).to have(1).errors_on(:duedate)
    end

    it "is invalid with outside title length" do
      invalid_title = 'a' * 101
      todo = FactoryGirl.build(:todo, title: invalid_title)
      expect(todo).to have(1).errors_on(:title)
    end

    it "is invalid with outside title length" do
      invalid_title = 'a' * 2
      todo = FactoryGirl.build(:todo, title: invalid_title)
      expect(todo).to have(1).errors_on(:title)
    end

  end
end
