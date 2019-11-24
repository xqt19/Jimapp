class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.boolean :completed || false
      t.string :difficulty || "Easy"
      t.string :category
      t.datetime :deadline

      t.timestamps
    end
  end
end
