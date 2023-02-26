class  Badges::AllWithLevelStrategy < Badges::InterfaceStrategy
  def reward?(test_passage:, rule_value:)
    level = rule_value
    user_id = test_passage.user_id

    (ids_of_all_tests_with_level(level) - ids_tests_with_level_successfully_passed_by_user(level: level, user_id: user_id)).blank?
  end

  private

  def ids_of_all_tests_with_level(level)
    Test.where(level: level).ids
  end

  def ids_tests_with_level_successfully_passed_by_user(level:, user_id:)
    TestPassage.by_user(user_id).joins(:test).where(tests: { level: level }).select { |test_passage| test_passage.succeeded? }.map(&:test_id).uniq
  end
end
