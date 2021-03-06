class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :group_id
      t.timestamps
    end

    create_table :groups_users do |t|
      t.belongs_to :group
      t.belongs_to :user
    end

  end
end
