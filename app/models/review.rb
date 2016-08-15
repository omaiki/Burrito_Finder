class Review < ActiveRecord::Base
  belongs_to :burrito
  belongs_to :user
  belongs_to :playground
  has_one :restaurant, :through => :burrito
end
