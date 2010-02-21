class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :mood
  
  validates_presence_of :mood
end

