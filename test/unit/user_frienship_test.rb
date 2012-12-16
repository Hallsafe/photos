require 'test_helper'

class UserFrienshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "that creating a friendship works" do 
		assert_nothing_raised do
		UserFrienship.create user: users(:joe), friend: users(:mike)
	end
end

	test "that creating a friendship based on user id and friend id works" do
	UserFrienship.create user_id: users(:joe).id, friend_id: users(:mike).id
	assert users(:joe).friends.include?(userse(:mike))
	end
end
