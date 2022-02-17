class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, uniqueness: true, length: { minimum: 1 }
end
