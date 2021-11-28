class CreateBadge < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :image_url
      t.string :rule
    end
  end
end
