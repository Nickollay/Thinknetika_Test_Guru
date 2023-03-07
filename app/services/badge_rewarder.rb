class BadgeRewarder
  RULES = {
    all_from_category: Badges::AllFromCategorySpecification,
    one_after_first_catch: Badges::OneAfterFirstCatchSpecification,
    all_with_level:  Badges::AllWithLevelSpecification
  }.with_indifferent_access

  def call(test_passage)
    return unless test_passage.succeeded?

    reward_user_with_badges(test_passage)
  end

  private

  def reward_user_with_badges(test_passage)
    rewarded_badges = []

    Badge.find_each do |badge|
      rule_type = badge.rule_type
      rule_value = badge.rule_value

      rewarded_badges << badge if RULES[rule_type].new.reward?(test_passage: test_passage, rule_value: rule_value)
    end

    reward_user(test_passage, rewarded_badges) if rewarded_badges.present?

    rewarded_badges
  end

  def reward_user(test_passage, rewarded_badges)
    test_passage.user.badges << rewarded_badges
  end
end
