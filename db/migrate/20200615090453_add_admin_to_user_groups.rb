class AddAdminToUserGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :user_groups, :admin, :boolean, :default => false
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
