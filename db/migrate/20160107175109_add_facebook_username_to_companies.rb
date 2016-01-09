class AddFacebookUsernameToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :facebook_username, :string
  end
end
