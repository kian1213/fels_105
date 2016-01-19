class Word < ActiveRecord::Base
  has_many :lesson_words
  has_many :answers
  belongs_to :category

  validates :content, presence: true
end