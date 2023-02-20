class BadgeRewarder
  RULES = {
    all_from_category: Badges::AllFromCategoryStrategy,
    one_after_first_catch: Badges::OneAfterFirstCatchStrategy,
    all_with_level:  Badges::AllWithLevelStrategy
  }.freeze #TODO: maybe add indiferent access

  def call(test_passage)
    #TODO: logic to check all badges if any satisfies rules?
    # reward user with badges
    #
    user = test_passage.user
    rewarded_badges = []

    Badge.find_each do |badge|
      rule_type = badge.rule_type
      rule_value = badge.rule_value

      #TODO: rewarded_badges << ... if ...
    end

    user.badges << rewarded_badges if rewarded_badges.present?
  end


  private

  def reward_user(user_id, badge)
    test_passage.user.badges << badges
  end

end
