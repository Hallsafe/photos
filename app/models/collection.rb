class Collection < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :name
  belongs_to :user 
  has_many :photos

  validates :title, presence: true,
  					length: {minimum: 2 }

  validates :user_id, presence: true
end
