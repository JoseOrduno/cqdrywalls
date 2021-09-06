class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :name
      t.string :url
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
