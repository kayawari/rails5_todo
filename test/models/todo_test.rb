require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

class TodoCountTest < ActiveSupport::TestCase
  test "todo_count" do
    assert_equal 4, Todo.count
  end
end
