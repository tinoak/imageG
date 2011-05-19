class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :user do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :user
  end
end
