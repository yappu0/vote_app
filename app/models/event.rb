class Event < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :evaluation_items, dependent: :destroy
  has_one :vote, dependent: :destroy

  accepts_nested_attributes_for :teams, :evaluation_items

  validates :name, presence: true
  validates :password, presence: true
  validates :point, presence: true, numericality: { only_integer: true }

  scope :default_order, -> { order(id: :desc) }
end
