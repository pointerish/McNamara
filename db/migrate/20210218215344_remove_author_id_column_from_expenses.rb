class RemoveAuthorIdColumnFromExpenses < ActiveRecord::Migration[6.1]
  def change
    remove_column :expenses, :author_id
  end
end
