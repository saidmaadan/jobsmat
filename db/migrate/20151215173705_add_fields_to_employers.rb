class AddFieldsToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :admin, :boolean, default: false
    add_column :employers, :author, :boolean, default: false
    add_column :employers, :headline, :text
  end
end
