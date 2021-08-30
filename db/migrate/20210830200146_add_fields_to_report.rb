class AddFieldsToReport < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :latitude, :decimal, { precision: 10, scale: 6 }
    add_column :reports, :longitude, :decimal, { precision: 10, scale: 6 }
    add_column :reports, :description, :string
    add_column :reports, :address, :string
    add_column :reports, :start_date, :date
    add_column :reports, :finish_date, :date
    add_column :reports, :cost, :date
  end
end
