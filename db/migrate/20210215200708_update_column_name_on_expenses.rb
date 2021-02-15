class UpdateColumnNameOnExpenses < ActiveRecord::Migration[6.1]
  def change
    rename_column :expenses, :author, :user_id
  end
end
