class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.string :name
      t.text :content
      t.belongs_to :user
      t.timestamp
    end
  end
end