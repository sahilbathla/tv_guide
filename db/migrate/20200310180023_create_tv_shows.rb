class CreateTvShows < ActiveRecord::Migration[5.2]
  def change
    create_table :tv_shows do |t|
      t.string :code, unique: true, comment: 'Unique Tv Code'
      t.string :name
      t.references :channel, index: true
      t.string :start_at, comment: 'Start time i.e 09:00'
      t.string :end_at, comment: 'End time i.e 09:30'
      t.string :repeats_on, comment: 'Repeats on which weekday i.e wday 0->Sunday 6->Saturday'

      t.timestamps
    end
  end
end
