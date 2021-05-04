class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.date :date
      t.integer :journal_id
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
