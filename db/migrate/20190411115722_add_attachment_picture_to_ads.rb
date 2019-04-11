class AddAttachmentPictureToAds < ActiveRecord::Migration[5.2]
  def change
    change_table :ads do |t|
      add_attachment :ads, :picture
    end
  end
end
