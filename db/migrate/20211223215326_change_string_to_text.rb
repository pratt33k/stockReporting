class ChangeStringToText < ActiveRecord::Migration[6.1]
  def change
    change_column :stocks, :description, :text
  end
end
