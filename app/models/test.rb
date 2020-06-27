class Test < ApplicationRecord

  has_many :user_test_associations
  has_many :users, through: :user_test_associations

  has_many :questions

  belongs_to :user
  belongs_to :category

  def self.test_titles_in_category(category)
    category_id = Category.where("title = ?", category).ids
    Test.where("tests.category_id = ?", category_id).order('title DESC').pluck(:title)
  end
end
