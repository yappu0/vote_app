class Vote < ApplicationRecord
  belongs_to :event
  belongs_to :team
  belongs_to :evaluation_item

  scope :default_order, -> { order(id: :desc) }
end
