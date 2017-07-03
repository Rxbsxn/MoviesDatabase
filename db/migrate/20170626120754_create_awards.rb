class CreateAwards < ActiveRecord::Migration[5.0]
  def change
    create_table :awards do |t|
      t.references :actor
      t.references :movie
      t.integer :award_type
      t.integer :role
      t.integer :year

      t.timestamps
    end
  end
end
