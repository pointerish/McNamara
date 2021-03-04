class AddGroupRefToExpenses < ActiveRecord::Migration[6.1]
  def change
    add_index :expenses, :group_id
  end
end
