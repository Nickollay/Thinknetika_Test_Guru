class ChangeTests < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tests, :timer_on, false
  end
end
