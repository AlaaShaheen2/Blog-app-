class ChangeColumnInComment < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :text, :text
  end
end
