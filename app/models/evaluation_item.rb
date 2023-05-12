class EvaluationItem < ApplicationRecord
  belongs_to :event

  has_many :scores, dependent: :destroy
  has_many :votes, dependent: :destroy

  scope :default_order, -> { order(id: :desc) }
end
