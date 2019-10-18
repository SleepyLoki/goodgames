class AddFeaturePhotoToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :feature_Photo, :string
  end
end
