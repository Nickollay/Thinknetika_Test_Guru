class Badges::OneAfterFirstCatchSpecification < Badges::InterfaceSpecification
  def reward?(test_passage:, rule_value:)
    test_id = rule_value
    user_id = test_passage.user_id

    (user_test_passages(user_id).by_test(test_id).count == 1) && test_passage.succeeded?
  end

  private

  def user_test_passages(user_id)
    TestPassage.by_user(user_id)
  end
end
