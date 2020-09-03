class Question < ApplicationRecord
  belongs_to :test


  has_many :answers, dependent: :destroy
  has_many :test_passages
  validates :body, presence: true
end
