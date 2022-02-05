class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :destination
      t.string :short

      t.timestamps
    end
  end
end
