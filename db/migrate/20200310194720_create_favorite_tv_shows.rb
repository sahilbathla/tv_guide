class CreateFavoriteTvShows < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_tv_shows do |t|
      t.references :user
      t.references :tv_show
      t.boolean :reminder_set, default: true
      t.timestamps
    end
  end
end
