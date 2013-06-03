class AddPlaceLocation < ActiveRecord::Migration
  def change
    add_column :places, :address, :string, after: :url
    add_column :places, :city, :string, after: :address
    add_column :places, :state, :string, after: :city
    add_column :places, :zipcode, :string, after: :state
  end
end
