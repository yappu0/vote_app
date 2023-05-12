class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :password, null: false
      t.integer :point, default: 0, null: false

      t.timestamps
    end
  end
end
