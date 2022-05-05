class AddIndexToStroll < ActiveRecord::Migration[5.2]
  def change
    add_reference :strolls, :dog, foreign_key: true
    add_reference :strolls, :dogsitter, foreign_key: true
  end
end
