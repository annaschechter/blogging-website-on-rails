class Post < ActiveRecord::Base
  resourcify
  has_many :comments
end
