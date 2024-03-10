class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :title, presence: true
  validates :overview, presence: true
end



# user - owner
# listing a new piece of clothing
# overview of the pieces that I've listed (dashboard)
# overvioew of the bids that were made on my clothes (dashboard)
# user - buyer
# see all the clothes
# see one specific piece of clothing
# make a bid on a piece of clother
# see the bids that I made (dashboard)



# 3 models: user, bid and clothing
