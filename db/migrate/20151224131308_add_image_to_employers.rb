class AddImageToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :emp_image, :string
  end
end
