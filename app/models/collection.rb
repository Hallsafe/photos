class Collection < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :name
  belongs_to :user 
end
