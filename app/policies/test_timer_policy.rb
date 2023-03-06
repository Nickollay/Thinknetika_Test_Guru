class TestTimerPolicy
  def call(test_passage)
    timer_policy(test_passage)
  end

  private

  def timer_policy(test_passage)
    test = test_passage.test

    return OpenStruct.new(success?: true) unless test.timer.present?

    if test_passage.time_left?
      OpenStruct.new(success?: true, message: "You've made it to the appointed time!")
    else
      nullify_results(test_passage)

      OpenStruct.new(success?: false, message: 'Time is over, all results were nullified!')
    end
  end

  def nullify_results(test_passage)
    test_passage.update_column(:correct_questions, 0)
  end
end
