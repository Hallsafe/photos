class Photo < ActiveRecord::Base
  attr_accessible :image, :name, :collection_id
  belongs_to :collection
  mount_uploader :image, ImageUploader

  validates :collection_id, presence: true
end
