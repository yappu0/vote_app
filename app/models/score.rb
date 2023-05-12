class Score < ApplicationRecord
  belongs_to :team
  belongs_to :evaluation_item
  belongs_to :vote
end
