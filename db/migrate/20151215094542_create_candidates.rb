class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :about
      t.string :experience
      t.string :education
      t.string :desired_salary
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :twitter_url
      t.string :linkedin_url
      t.string :facebook_url
      t.string :github_url
      t.string :bb_pin
      t.string :provider
      t.string :uid
      t.string :auth_token
      t.string :website_url
      t.string :instagram_url
      t.string :availability
      t.string :skills
      t.string :job_type
      t.string :languages
      t.string :how_heard
      t.string :cand_image
      t.string :resume
      t.string :projects_link
      t.string :portfolio_url
      t.string :favorite_websites
      t.string :headlines
      t.string :skype_id
      t.string :phone_number
      t.string :slug

      t.timestamps null: false
    end
    add_index :candidates, :slug, unique: true
  end
end
