require 'rails_helper'

describe Todo do
  describe 'Model' do
    it "is valid with a checked_flg, title, memo, duedate" do
      todo = FactoryGirl.build(:todo)
      expect(todo).to be_valid
    end

    it "is invalid without title" do
      todo = FactoryGirl.build(:todo, title:nil)
      todo.valid?
      expect(todo.errors[:title]).to include("can't be blank")
    end
    
    it "is valid with blank memo" do
      todo = FactoryGirl.build(:todo, memo: nil)
      expect(todo).to be_valid
    end
  end
end
