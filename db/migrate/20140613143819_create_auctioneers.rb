class CreateAuctioneers < ActiveRecord::Migration
  def change
    create_table :auctioneers do |t|

      t.timestamps
    end
  end
end
