class Movie < ApplicationRecord
  has_many :bookmarks
# if bookmark
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
