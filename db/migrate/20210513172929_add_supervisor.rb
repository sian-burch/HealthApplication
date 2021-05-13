# Admin Tutorial referenced from: https://altalogy.com/blog/rails-6-user-accounts-with-3-types-of-roles/
class AddSupervisor < ActiveRecord::Migration[5.2]
  def change
    User.create! do |u|
      # These data should be hidden or changed during production or deployment status
        u.email     = 'website_supervisor@test.com'
        u.password  = '@Password456'
        u.terms_and_agreements = true
        u.superadmin_role = false
        u.supervisor_role = true
        u.user_role = false
    end
  end
end
