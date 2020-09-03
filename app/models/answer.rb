class Answer < ApplicationRecord
  LIMIT = 4

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :validate_answer_limit, on: :create


  private

  def validate_answer_limit
    # return unless self.question

    if question.answers.count >= LIMIT
      errors.add(:answer, "can't include more than 4 answers.")
    end
  end
end
