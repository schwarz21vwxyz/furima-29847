class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,         null: false
      t.text       :comment,      null: false
      t.integer    :category_id,  null: false
      t.integer    :show_id,      null: false
      t.integer    :delivery_id,  null: false
      t.integer    :area_id,      null: false
      t.integer    :day_id,       null: false
      t.integer    :price,        null: false
      t.references :user,  null: false, foreign_key:


      t.timestamps
    end
  end
end
