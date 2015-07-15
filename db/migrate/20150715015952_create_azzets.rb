class CreateAzzets < ActiveRecord::Migration
  def change
    create_table :azzets do |t|
      t.string :Type
      t.string :Name

      t.timestamps null: false
    end
  end
end
