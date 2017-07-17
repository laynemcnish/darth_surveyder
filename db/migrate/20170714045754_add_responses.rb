class AddResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.references :user
      t.references :survey
      t.boolean :answer
      t.timestamps
    end
  end
end
