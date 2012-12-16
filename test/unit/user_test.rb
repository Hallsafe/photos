require 'test_helper'

class UserTest < ActiveSupport::TestCase
 should have_many(:user_frienships)
 should have_many(:friends)
end

test "that no error is raised when trying to access a friend list"
	assert_nothing_raised do 
		user(:joe).friends
		end
	end

	test "that creating friendships on a user works" do
		users(:joe).friends << users(:mike)
		users(:joe).friends.reload
		assert users(:joe).friends.include?(users(:mike))
	end
end


end
