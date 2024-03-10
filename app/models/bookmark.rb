class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6, too_short: 'Must be at least 6 characters' }
  validates :movie_id, uniqueness: { scope: :list_id, message: 'Is already added to the list' }
end
