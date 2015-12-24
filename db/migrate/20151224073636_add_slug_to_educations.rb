class AddSlugToEducations < ActiveRecord::Migration
  def change
    add_column :educations, :slug, :string
    add_index :educations, :slug, unique: true
  end
end
