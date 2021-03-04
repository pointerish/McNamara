class UpdateTimeZoneInExpenses < ActiveRecord::Migration[6.1]
  def change
    change_column :expenses, :time_zone, :date
  end
end
