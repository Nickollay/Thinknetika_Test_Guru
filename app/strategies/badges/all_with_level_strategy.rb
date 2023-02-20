class  Badges::AllWithLevelStrategy < Badges::InterfaceStrategy
  #TODO: add implementation
  def reward?(test_passage)

    # def all_with_level?(level_id:, user_id:)
    @_is_all_with_level ||=
      (ids_of_all_tests_with_level(level_id) - ids_tests_with_level_successfully_passed_by_user(level_id: level_id, user_id: user_id)).blank?
    # end

  end

end
