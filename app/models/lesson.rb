class Lesson < ActiveRecord::Base
  has_many :lesson_words
  belongs_to :user
  belongs_to :category

  accepts_nested_attributes_for :lesson_words, allow_destroy: true

  after_create :generate_words

  def next_is_nil? lesson_word_id
    @next_word = self.lesson_words.where("id > ?", lesson_word_id)
    @next_word.empty?
  end

  private
  def generate_words
    @category_words = Category.find(self.category_id).words.order("RAND()").pluck(:id).first(20)
    @category_words.each do |word_id|
      LessonWord.create(lesson_id: self.id, word_id: word_id)
    end
  end
end