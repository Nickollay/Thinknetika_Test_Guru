class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  REGEX_EMAIL_PATTERN = /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, foreign_key: :creator_id, class_name: 'Test', dependent: :nullify
  has_many :gists
  has_many :badges
  validates :email, presence: true, uniqueness: true, format: { with: REGEX_EMAIL_PATTERN }

  def tests_participated_by_user(level)
    tests.where(tests: { level: level } )
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def name
    "#{first_name} #{last_name}"
  end
end
