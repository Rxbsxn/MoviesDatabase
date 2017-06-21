class AddGenreIdToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :genre_id, :reference
  end
end
