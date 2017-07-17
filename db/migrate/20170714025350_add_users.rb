class AddUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :rank, null: false, default: "Lieutenant"
      t.timestamps
    end
  end
end
