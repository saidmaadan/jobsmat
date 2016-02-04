class AddResumeStatusToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :resume_status, :string
  end
end
