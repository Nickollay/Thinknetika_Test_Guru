class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :rule_type, default: 0
      t.string :rule_value
      t.references :creator, null: false, foreign_key: { to_table: :users }
    end
  end
end
