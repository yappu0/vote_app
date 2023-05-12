class Score < ApplicationRecord
  belongs_to :team
  belongs_to :evaluation_item
end
