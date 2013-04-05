class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.integer :country_id
      t.string :iso
      t.string :name

      t.timestamps
    end
  end
end
