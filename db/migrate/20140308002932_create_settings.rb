class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :data

      t.timestamps
    end
  end
end
