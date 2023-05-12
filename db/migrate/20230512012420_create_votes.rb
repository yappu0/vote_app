class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :event, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :evaluation_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
