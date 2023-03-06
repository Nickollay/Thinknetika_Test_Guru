class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  scope :by_user, -> (user_id) { where(user_id: user_id) }
  scope :by_test, -> (test_id) { where(test_id: test_id) }

  before_validation :before_validation_set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if time_over?
      self.correct_questions = 0
    elsif correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def succeeded?
   success_percent >= 85
  end

  def success_percent
    ((correct_questions.to_f/test.questions.count)*100).round(2)
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def time_left
    start = created_at
    current_time = Time.current
    duration = test.timer

    seconds = (start + duration.seconds) - current_time

    if seconds > 0
      seconds
    else
      0
    end
  end

  def time_left?
    return true if test.timer.blank?

    time_left > 0
  end

  def time_over?
    !time_left?
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)    
    answer_ids&.map(&:to_i)&.sort == correct_answers.ids.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.present?
      test.questions.order(:id).where('id > ?', current_question.id).first
    else
      self.current_question = test.questions.first if test.present?
    end
  end
end
