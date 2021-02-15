class AddColumnGroupIdToExpenses < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :group_id, :integer
  end
end
