class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer     :postal_code,   null: false
      t.integer     :area_id,    null: false
      t.string      :city
      t.string      :address
      t.string      :building_name
      t.string      :phone_num
      t.references  :buyer,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
