class AddDescriptionToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :description, :text, null: false
  end
end
