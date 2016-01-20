class AddProToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :pro, :boolean, default: false
  end
end
