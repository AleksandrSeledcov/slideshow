class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :url
      t.integer :user_id
      t.integer :slideshow_id

      t.timestamps
    end
  end
end
