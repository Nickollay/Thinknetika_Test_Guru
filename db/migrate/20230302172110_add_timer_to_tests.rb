class AddTimerToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :timer, :integer
    add_column :tests, :timer_on, :boolean
  end
end
