class AddUrlAndEmailToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :email, :string
    add_column :jobs, :url, :string
  end
end
