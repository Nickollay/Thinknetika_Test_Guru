class CreateJoinTableBadgesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :badges_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :badge

      t.timestamps
    end
  end
end
