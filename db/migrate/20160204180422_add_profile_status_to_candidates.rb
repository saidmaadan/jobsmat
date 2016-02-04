class AddProfileStatusToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :profile_status, :string
    add_column :candidates, :email_status, :string
    add_column :candidates, :phone_status, :string
  end
end
