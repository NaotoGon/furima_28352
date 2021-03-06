class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price,  null:false
      t.string :text,  null:false
      t.references :user,  foreign_key: true
      t.integer :category_id,  null:false
      t.integer :status_id,  null:false
      t.integer :ship_fee_id,  null:false
      t.integer :region_id,  null:false
      t.integer :during_id,  null:false
      t.timestamps
    end
  end
end
