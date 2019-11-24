class CreateInstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :instructions do |t|
      t.string :instruction
      t.references :exercise, foreign_key: true
      t.references :session, foreign_key: true

      t.timestamps
    end
  end
end
