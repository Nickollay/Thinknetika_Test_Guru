class Badge < ApplicationRecord
  enum rule_type: {
    all_from_category: 0,
    one_after_first_catch: 1,
    all_with_level: 2
  }

  ENUM_RULE_TYPES = Badge.rule_types
  RULE_TYPES = ENUM_RULE_TYPES.keys
  ALL_FROM_CATEGORY = 'all_from_category'
  ONE_AFTER_FIRST_CATCH = 'one_after_first_catch'
  ALL_WITH_LEVEL = 'all_with_level'

  has_and_belongs_to_many :users

  belongs_to :creator, foreign_key: :creator_id, class_name: 'User', optional: true

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true
end

#TODO: in service 1. implement some method that finds all rule_type `s those related to current test; for ex at the same time after test is passed there can be
# a few badges awarded or even all of them
