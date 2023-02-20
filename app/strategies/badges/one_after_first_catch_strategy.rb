class Badges::OneAfterFirstCatchStrategy < Badges::InterfaceStrategy
  #TODO: add implementation
  def reward?(test_passage)

    # def one_after_first_catch?(test_passage:, user_id:, test_id:)
    @_is_one_after_first_catch ||=
      (user_test_passages(user_id).by_test(test_id).count == 1) && test_passage.succeeded?
    # end
    #
  end


end
