class CreateFamousQuotes < ActiveRecord::Migration
  def change
    create_table :famous_quotes do |t|
      t.string :author
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
