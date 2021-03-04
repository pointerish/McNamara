class AddColumnGroupNameToExpenses < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :group_name, :string
  end
end
