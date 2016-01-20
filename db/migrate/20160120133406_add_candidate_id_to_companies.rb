class AddCandidateIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :candidate_id, :integer
  end
end
