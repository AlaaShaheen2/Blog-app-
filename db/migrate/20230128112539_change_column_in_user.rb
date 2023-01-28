class ChangeColumnInUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :bio, :text
  end
end
