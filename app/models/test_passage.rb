class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  attr_accessor :current_question_number

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def succeeded?
    return true if succes_percent >= 85

    false
  end

  def succes_percent
    return 0 unless correct_questions
    
    (correct_questions/test.questions.count)*100  
  end


  private

  def before_validation_set_first_question
    current_question_number = 1
    
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    current_question_number += 1
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)    
    answer_ids&.map(&:to_i)&.sort == correct_answers.ids.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
