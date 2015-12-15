class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :company_name
      t.string :location
      t.string :zip_code
      t.string :twitter
      t.string :linkedin
      t.string :facebook
      t.string :website_url
      t.string :instagram
      t.text :company_description
      t.string :EmpImage
      t.string :headlines
      t.string :industry
      t.string :company_size
      t.string :skype_id
      t.string :phone_number
      t.string :logo
      t.string :auth_token
      t.string :slug

      t.timestamps null: false
    end
    add_index :employers, :slug, unique: true
  end
end
