class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.references :team, null: false, foreign_key: true
      t.references :evaluation_item, null: false, foreign_key: true
      t.references :vote, null: false, foreign_key: true
      t.integer :point, null: false, default: 0

      t.timestamps
    end
  end
end
