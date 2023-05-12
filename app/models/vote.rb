class Vote < ApplicationRecord
  belongs_to :event

  scope :default_order, -> { order(id: :desc) }
end
