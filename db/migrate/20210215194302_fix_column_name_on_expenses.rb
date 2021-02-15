class FixColumnNameOnExpenses < ActiveRecord::Migration[6.1]
  def change
    rename_column :expenses, :authorid, :author
  end
end
