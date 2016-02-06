class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, {null: false, limit: 100}
      t.string :address, {null: false}
      t.string :day, {null: false, limit: 20}
      t.string :url
      t.string :facebook
      t.string :time, {null: false}
      t.float :lat, {null: false}
      t.float :lng, {null: false}

      t.timestamps
    end
  end
end
