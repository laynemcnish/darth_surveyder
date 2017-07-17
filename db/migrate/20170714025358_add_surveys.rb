class AddSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.string :question, null: false
      t.references :user, null: false
      t.references :category, null: false
      t.timestamps
    end
  end
end
