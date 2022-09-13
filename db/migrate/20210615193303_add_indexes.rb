class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, %i[title level]
  end
end
