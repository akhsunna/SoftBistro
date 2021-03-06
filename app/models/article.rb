class Article < ActiveRecord::Base
  has_many :comments, :as => :commentable
  belongs_to :user

  mount_uploader :cover, CoverUploader
end
