class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :time
      t.belongs_to :host

      t.timestamps
    end
  end
end
