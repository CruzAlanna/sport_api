class DropMatches < ActiveRecord::Migration[8.0]
  def change
    drop_table :matches
  end
end
