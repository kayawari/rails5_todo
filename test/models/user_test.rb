require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @test_user = User.new(name: "てすと太郎", email:"sample@gmail.com")
  end
  
  test "should be valid" do
    assert @test_user.valid?
  end 
end
