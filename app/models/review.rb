class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, presence: true
  validates_length_of :content_body, in: 50..250
  validates :rating, presence: true
  validates_numericality_of :rating, greater_than: 0, less_than: 6
  before_save(:titleize_author)

  private
    def titleize_author
      self.author = self.author.titleize
    end
end