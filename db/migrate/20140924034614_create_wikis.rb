class CreateWikis < ActiveRecord::Migration
 def change
    create_table :wikis do |t|
      t.string :name
      t.boolean :public, default: true
      t.integer :user_id

      t.timestamps
    end
  end
end
