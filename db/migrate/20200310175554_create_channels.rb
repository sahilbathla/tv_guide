class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :name, null: false, comment: 'Name of the channel'

      t.timestamps
    end
  end
end
