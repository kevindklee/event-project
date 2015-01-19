class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :startdatetime
      t.datetime :enddatetime

      t.timestamps
    end
  end
end
