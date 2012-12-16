require 'test_helper'

class CollectionTest < ActiveSupport::TestCase
 test "that a collection requires content" do 
 	collection = Collection.new
 	assert !collection.save
 	assert !collection.errors[:title].empty?
 end
 	
 	test "that a collection's title is at least 2 letters" do
 		collection = Collection.new
 		collection.title = "h"
 		assert !collection.save
 		assert !collection.errors[:title].empty?
 end

 test "that a collection has a user id" do
 	collection = Collection.new
 	collection.title = "Hello"
 	assert !collection.save
 	assert !collection.errors[:user_id].empty?

 end
end
