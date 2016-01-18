class Answer < ActiveRecord::Base
  belongs_to :word

  validates :answer, presence: true
end