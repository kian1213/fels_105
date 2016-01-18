class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word

  validates :correct, presence: true
end