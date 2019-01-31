class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :title
    end

    create_join_table :gossips, :tags do |t|
       t.index [:gossip_id, :tag_id]
       t.index [:tag_id, :gossip_id]
    end
  end
end