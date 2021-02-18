class AddColumnToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :description, :string
  end
end
