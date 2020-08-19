class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :score
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :level, null: false, foreign_key: true

      t.timestamps
    end
  end
end
