class AddTimeZoneToExpense < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :time_zone, :string
  end
end
