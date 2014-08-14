class CreateReceiptScanners < ActiveRecord::Migration
  def change
    create_table :receipt_scanners do |t|
      t.string :email
      t.text :notes
      t.string :business_percentage
      t.date :date
      t.string :receipt_scanner_photo

      t.timestamps
    end
  end
end
