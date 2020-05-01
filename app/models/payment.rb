class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :category

  default_scope -> { order(date: :desc)}
  validates :user_id, presence: true

  validates :price, presence:true, numericality: true
  validates :content, length: { maximum: 140 }, presence: true

end
