class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer

  def next_is_nil? id, lesson_id
    @next_word = Lesson.find(lesson_id).lesson_words.where("id > ?", id)
    @next_word.empty?
  end
end