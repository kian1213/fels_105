class Lesson < ActiveRecord::Base
  has_many :lesson_words
  has_many :activities
  belongs_to :user
  belongs_to :category
end