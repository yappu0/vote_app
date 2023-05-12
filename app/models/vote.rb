class Vote < ApplicationRecord
  belongs_to :event

  has_many :scores, dependent: :destroy

  accepts_nested_attributes_for :scores

  validate :validate_points_within_limit

  scope :default_order, -> { order(id: :desc) }

  private

  def validate_points_within_limit
    total_points = scores.sum(&:point)
    if total_points > event.point
      errors.add(:base, "持ち点以上の点数を投票することはできません。")
    end
  end
end
