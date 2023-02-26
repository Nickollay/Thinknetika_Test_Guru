class BadgeRewarder
  RULES = {
    all_from_category: Badges::AllFromCategoryStrategy,
    one_after_first_catch: Badges::OneAfterFirstCatchStrategy,
    all_with_level:  Badges::AllWithLevelStrategy
  }.with_indifferent_access

  def call(test_passage)
    #TODO: logic to check all badges if any satisfies rules?
    # reward user with badges
    #
    rewarded_badges = []

    Badge.find_each do |badge|
      rule_type = badge.rule_type
      rule_value = badge.rule_value

      rewarded_badges << badge if RULES[rule_type].new.reward?(test_passage: test_passage, rule_value: rule_value)
    end

    reward_user(test_passage, rewarded_badges) if rewarded_badges.present?
  end

  private

  def reward_user(test_passage, rewarded_badges)
    test_passage.user.badges << rewarded_badges #
  end
end
