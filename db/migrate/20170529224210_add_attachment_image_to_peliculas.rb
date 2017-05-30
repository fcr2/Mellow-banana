class AddAttachmentImageToPeliculas < ActiveRecord::Migration
  def self.up
    change_table :peliculas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :peliculas, :image
  end
end
