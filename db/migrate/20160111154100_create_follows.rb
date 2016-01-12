class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :company, index: true, foreign_key: true
      t.references :candidate, index: true, foreign_key: true
      t.references :employer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
