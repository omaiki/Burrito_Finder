class Review < ActiveRecord::Base
  belongs_to :burrito
  belongs_to :user
  has_one :restaurant, :through => :burrito
  belongs_to :playground
end
