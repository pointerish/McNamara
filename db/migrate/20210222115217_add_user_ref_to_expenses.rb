class AddUserRefToExpenses < ActiveRecord::Migration[6.1]
  def change
    add_index :expenses, :user_id
  end
end
