class Collection < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :name
  belongs_to :user 
  has_many :photos
end
