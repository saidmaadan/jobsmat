class AddTwoFieldsToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :headline, :text
    add_column :candidates, :dribbble_url, :string
  end
end
