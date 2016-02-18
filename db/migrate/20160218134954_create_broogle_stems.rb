class CreateBroogleStems < ActiveRecord::Migration
  def change
    create_table :broogle_stems do |t|
      t.string :matched_string, null: false
      t.string :content, null: false
      t.string :column, null: false
      t.references :document, index: true, polymorphic: true, null: false

      t.index :content
      t.index :column

      t.timestamps null: false
    end
  end
end
