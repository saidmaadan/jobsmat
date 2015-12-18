class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :title
      t.text :content
      t.string :source_url
      t.integer :employer_id
      t.string :logo
      t.string :slug

      t.timestamps null: false
    end
    add_index :tips, :slug, unique: true
  end
end
