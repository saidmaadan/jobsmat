class AddFieldsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :twitter_username, :string
    add_column :companies, :twitter_widget_id, :string
  end
end
