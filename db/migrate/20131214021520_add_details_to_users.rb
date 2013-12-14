class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pledge_semester, :string
    add_column :users, :pledge_year, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :grad_year, :integer
    add_column :users, :major, :string
    add_column :users, :birth_day, :datetime
  end
end
