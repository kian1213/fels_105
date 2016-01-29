class Lesson < ActiveRecord::Base
  has_many :lesson_words
  belongs_to :user
  belongs_to :category

  accepts_nested_attributes_for :lesson_words, allow_destroy: true

  after_create :generate_words

  def total_correct_answer
    @total_correct = lesson_words.select{|lesson_word|
      lesson_word.answer.correct? unless
      lesson_word.answer.nil?}.count
  end

  private
  def generate_words
    @category_words = self.category.words.pluck(:id).sample 20
    @category_words.each do |word_id|
      LessonWord.create lesson_id: self.id, word_id: word_id
    end
  end
end