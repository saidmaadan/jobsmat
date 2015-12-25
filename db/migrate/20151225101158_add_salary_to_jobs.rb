class AddSalaryToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :salary, :string
  end
end
