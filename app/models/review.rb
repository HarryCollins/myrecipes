class Review < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe

  validates :header, presence: true, length: { maximum: 150 }
  validates :body, presence: true, length: { minimum: 20, maximum: 500 }
  validates :rating, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5 }
  validates_uniqueness_of :chef, scope: :recipe
end