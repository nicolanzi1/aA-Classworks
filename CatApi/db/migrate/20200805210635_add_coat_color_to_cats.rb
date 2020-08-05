class AddCoatColorToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :coat_color, :string, null: false
  end
end
