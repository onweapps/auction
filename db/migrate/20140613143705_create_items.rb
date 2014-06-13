class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :sold, default: false
      t.timestamps
    end
  end
end
