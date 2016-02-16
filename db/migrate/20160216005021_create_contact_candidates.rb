class CreateContactCandidates < ActiveRecord::Migration
  def change
    create_table :contact_candidates do |t|
      t.string :name
      t.string :email
      t.string :message
      t.integer :candidate_id
      t.integer :job_id
      t.integer :employer_id

      t.timestamps null: false
    end
  end
end
