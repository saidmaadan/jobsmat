class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :skills
      t.text :description
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :position_type
      t.string :pay_rate
      t.string :job_length
      t.string :travel_required
      t.integer :employer_id
      t.integer :candidate_id
      t.integer :company_id
      t.string :company_name
      t.string :industry
      t.string :logo
      t.string :company_size
      t.string :website_url
      t.text :company_description
      t.text :responsibility
      t.string :experience
      t.string :slug

      t.timestamps null: false
    end
    add_index :jobs, :slug, unique: true
  end
end
