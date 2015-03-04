class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :funding_level
      t.string :name, null: false
      t.string :email, null: false
      t.integer :amount, null: false, default: 0
      t.timestamps null: false
    end
  end
end
