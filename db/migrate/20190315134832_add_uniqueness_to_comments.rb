class AddUniquenessToComments < ActiveRecord::Migration[5.2]
  def up
    add_index(:comments, [:user_id, :movie_id], unique: true)
  end
  def down
    remove_index :comments, column: [:user_id, :movie_id]
  end
end
