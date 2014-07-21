class CreateKeyDates < ActiveRecord::Migration
  def change
    create_table :key_dates do |t|
      t.string :month
      t.date :tax_date
      t.string :title
      t.text :obligation

      t.timestamps
    end
  end
end
