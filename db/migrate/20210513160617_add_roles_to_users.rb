class AddRolesToUsers < ActiveRecord::Migration[5.2]
  # Admin Tutorial referenced from: https://altalogy.com/blog/rails-6-user-accounts-with-3-types-of-roles/
  def change
    add_column :users, :superadmin_role, :boolean, :default => false
    add_column :users, :supervisor_role, :boolean, :default => false
    add_column :users, :user_role, :boolean, :default => true
  end
end
