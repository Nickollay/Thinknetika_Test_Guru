class Badge < ApplicationRecord
  enum rule_type: {
    #TODO: add types:
    all_from_category: 0,
    bar: 1
  }

  has_and_belongs_to_many :users

  belongs_to :creator, foreign_key: :creator_id, class_name: 'User', optional: true

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true
end
