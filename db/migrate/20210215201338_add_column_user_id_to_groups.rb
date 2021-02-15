class AddColumnUserIdToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :user_id, :integer
  end
end
