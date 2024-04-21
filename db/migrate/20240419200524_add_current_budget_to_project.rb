class AddCurrentBudgetToProject < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :current_budget, :integer
  end
end
