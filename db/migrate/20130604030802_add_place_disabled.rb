class AddPlaceDisabled < ActiveRecord::Migration
  def change
    add_column :places, :disabled, :boolean, default: false, after: :zipcode
  end
end
