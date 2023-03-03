class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :tests, dependent: :nullify

  validates :title, presence: true

  alias_attribute :name, :title
end
