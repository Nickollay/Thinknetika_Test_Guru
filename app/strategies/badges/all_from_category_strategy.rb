class Badges::AllFromCategoryStrategy < Badges::InterfaceStrategy
  def reward?(test_passage)
    category_id = test_passage.test.category_id
    user_id = test_passage.user_id

    (ids_of_all_tests_from_category(category_id) - ids_of_tests_from_category_successfully_passed_by_user(category_id: category_id, user_id: user_id)).blank?
  end

  private

  def ids_of_all_tests_from_category(category_id)
    Test.by_category(category_id).ids
  end

  def ids_of_tests_from_category_successfully_passed_by_user(category_id:, user_id:)
    TestPassage.joins(:test).where(user_id: user_id).where(tests: { category_id: category_id }).select { |test_passage| test_passage.succeeded? }.map(&:test_id).uniq
  end
end
