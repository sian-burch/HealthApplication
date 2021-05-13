# Admin Tutorial referenced from: https://altalogy.com/blog/rails-6-user-accounts-with-3-types-of-roles/
class AddSuperadmin < ActiveRecord::Migration[5.2]  
  def change
    User.create! do |u|
      # These data should be hidden or changed during production or deployment status
        u.email     = 'website_admin@test.com'
        u.password  = '@Password123'
        u.terms_and_agreements = true
        u.superadmin_role = true
        u.supervisor_role = false
        u.user_role = false
    end
  end
end
