class AddUserRefToGroups < ActiveRecord::Migration[6.1]
  def change
    add_index :groups, :user_id
  end
end
