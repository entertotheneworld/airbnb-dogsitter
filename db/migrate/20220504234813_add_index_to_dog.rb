class AddIndexToDog < ActiveRecord::Migration[5.2]
  def change
    add_reference :dogs, :city, foreign_key: true
  end
end
