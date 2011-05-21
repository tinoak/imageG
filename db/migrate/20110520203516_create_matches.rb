class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.string :startphoto
      t.string :endphoto
      t.string :startuser
      t.string :enduser

      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
