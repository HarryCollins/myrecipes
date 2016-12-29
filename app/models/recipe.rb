class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :likes, dependent: :destroy
  has_many :recipe_styles, dependent: :destroy
  has_many :styles,  through: :recipe_styles
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients,  through: :recipe_ingredients
  has_many :reviews

  validates :chef_id, presence: true
  validates :name, presence: true, length: { minimum: 5, maximum: 100}
  validates :summary, presence: true, length: { minimum: 10, maximum: 150}
  validates :description, presence: true, length: { minimum: 20, maximum: 500}

  mount_uploader :picture, PictureUploader
  validate :picture_size

  default_scope -> { order(updated_at: :desc) }

  def count_likes
    self.likes.where(like: true).size
  end

  def count_dislikes
    self.likes.where(like: false).size
  end

  def count_reviews
    self.reviews.select(:rating).size
  end

  def count_stars
    self.reviews.sum(:rating)
  end

  def average_stars
    (count_stars.to_f / count_reviews).round(2) unless count_reviews == 0
  end

  private
    def picture_size
      if picture.size > 5.megabytes
      	errors.add(:picture, "should be less that 5MB")
      end
    end

end