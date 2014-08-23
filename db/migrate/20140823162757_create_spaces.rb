class CreateSpaces < ActiveRecord::Migration
  def change
  	
    create_table :spaces do |t|
      t.integer :user_id
      t.text :description
      t.references :appointments
      t.timestamps
    end
  end
end
