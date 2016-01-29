class Lesson < ActiveRecord::Base
  has_many :lesson_words
  belongs_to :user
  belongs_to :category

  accepts_nested_attributes_for :lesson_words, reject_if:
    lambda {|a| a[:content].blank?}, allow_destroy: true

  after_create :generate_words

  private
  def generate_words
    @category_words = Category.find(self.category_id).words.order("RAND()").pluck(:id).first(20)
    @category_words.each do |word_id|
      LessonWord.create(lesson_id: self.id, word_id: word_id)
    end
  end
end