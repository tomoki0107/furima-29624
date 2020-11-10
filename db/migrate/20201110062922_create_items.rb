class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :content,      null: false
      t.text       :info,         null: false
      t.integer    :category_id,  null: false
      t.integer    :condition_id, null: false
      t.integer    :burden_id,    null: false
      t.integer    :area_id,      null: false
      t.integer    :day_id,       null: false
      t.integer    :price,        null: false
      t.references :user, foreign_key: true
    end
  end
end
