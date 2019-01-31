class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :postal_code
      t.timestamps
    end

    change_table :users do |t|
      t.belongs_to :city
    end
  end
end