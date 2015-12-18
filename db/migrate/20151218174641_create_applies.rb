class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.string :name
      t.string :email
      t.text :message
      t.string :resume
      t.integer :candidate_id
      t.integer :job_id
      t.integer :employer_id
      t.string :phone


      t.timestamps null: false
    end
  end
end
