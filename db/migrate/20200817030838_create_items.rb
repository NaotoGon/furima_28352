class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :image,  null:false
      t.integer :price,  null:false
      t.string :text,  null:false
      t.references :user,  foreign_key: true
      t.integer :category,  null:false
      t.integer :status,  null:false
      t.integer :ship_fee,  null:false
      t.integer :region,  null:false
      t.integer :during,  null:false
      t.timestamps
    end
  end
end
