class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :about
      t.string :industry
      t.string :founded
      t.string :size
      t.string :subsidiaries
      t.string :location
      t.string :website
      t.string :logo
      t.string :company_image
      t.string :slug
      t.integer :employer_id
      t.string :facebook
      t.string :twitter
      t.string :youtube
      t.string :linkedin
      t.string :video
      t.string :instagram
      t.string :googleplus
      t.string :pinterest
      t.string :github
      t.text :twitter_widget

      t.timestamps null: false
    end
    add_index :companies, :slug, unique: true
  end
end
