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

  it "is valid with a upcase duplicate email" do
    FactoryGirl.create(:user)
    upcase_email = "sample@gmail.com".upcase
    user = FactoryGirl.build(:user, email:upcase_email)
    expect(user).to be_valid
  end

  it "is invalid with illegal email" do
    user = FactoryGirl.build(:user, email:'hogehoge')
    expect(user).to have(1).errors_on(:email)
  end

  it "is invalid with 7 letter password" do
    user = FactoryGirl.build(:user, password:"a"*7)
    expect(user).to have(1).errors_on(:password)
  end

  it "is valid with 8 letter password" do
    user = FactoryGirl.build(:user, password:"a"*8)
    expect(user).to be_valid
  end

  context "is black" do
    before do
      @user = FactoryGirl.build(:user, name:nil, email:nil, password:nil)
    end

    it "name is invalid" do
      expect(@user).to have(1).errors_on(:name)
    end

    it "email is invalid" do
      expect(@user).to have(2).errors_on(:email)
    end

    it "password is invalid" do
      expect(@user).to have(3).errors_on(:password)
    end
  end
end
