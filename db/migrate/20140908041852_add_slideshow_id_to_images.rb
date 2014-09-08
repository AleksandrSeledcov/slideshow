class AddSlideshowIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :slideshow_id, :integer
  end
end
