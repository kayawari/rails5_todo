require 'rails_helper'

describe User do
  it "is valid with name, email" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it "is invalid with a duplicate email" do
    FactoryGirl.create(:user)
    user = FactoryGirl.build(:user, email:"sample@gmail.com")
    expect(user).to have(1).errors_on(:email)
  end

  it "is invalid with illegal email" do
    user = FactoryGirl.build(:user, email:'hogehoge')
    expect(user).to have(1).errors_on(:email)
  end

  context "is black" do
    before do
      @user = FactoryGirl.build(:user, name:nil, email:nil)
    end

    it "name is invalid" do
      expect(@user).to have(1).errors_on(:name)
    end

    it "email is invalid" do
      expect(@user).to have(2).errors_on(:email)
    end
  end
end
