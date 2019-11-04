class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
			t.references :users, index: true
			t.datetime :start_date
			t.datetime :end_date 
			t.integer :duration
			t.string :title
			t.text :description
			t.integer :price
			t.string :location

      t.timestamps
    end
  end
end