class Movie < ApplicationRecord
  has_many :bookmarks
  has_one :list, through: :bookmarks

  validates :title, :overview, uniqueness: true, length: { minimum: 1 }
  before_destroy :check_for_referenced_bookmarks

  def check_for_referenced_bookmarks
    bookmarks.count.positive?
  end
end
