class CreateSpaces < ActiveRecord::Migration
  def change
  	
    create_table :spaces do |t|
      t.integer :user_id
      t.string :name
      t.string :slug
      t.text :description
      t.decimal :weekly_price_pence
      t.references :appointments
      t.timestamps
    end
  end
end
