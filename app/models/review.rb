class Review < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :rating
  validates_presence_of :text
end
