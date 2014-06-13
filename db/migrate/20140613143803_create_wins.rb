class CreateWins < ActiveRecord::Migration
  def change
    create_table :wins do |t|
      t.belongs_to :item
      t.belongs_to :user
      t.integer :amount
      t.timestamps
    end
  end
end
