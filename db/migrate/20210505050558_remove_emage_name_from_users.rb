class RemoveEmageNameFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :emage_name, :string
  end
end
