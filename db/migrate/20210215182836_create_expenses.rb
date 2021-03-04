class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :author_id
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
