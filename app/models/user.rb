class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_many :created_tests, foreign_key: :creator_id, class_name: 'Test', dependent: :nullify

  validates :name, :email, :encrypted_password, presence: true

  def tests_participated_by_user(level)
    tests.where(tests: { level: level } )
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
