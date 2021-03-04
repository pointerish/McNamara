class AddSlugToExpenses < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :slug, :string
  end
end
