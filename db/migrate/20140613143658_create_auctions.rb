class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.belongs_to :item
      t.integer :reserve
      t.boolean :active, default: false
      t.boolean :success
      t.timestamps
    end
  end
end
