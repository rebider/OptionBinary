class CreateStrategies < ActiveRecord::Migration
  def change
    create_table :strategies do |t|
      t.string :Name
      t.string :Type
      t.foreign_key :User, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
