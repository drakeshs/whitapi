class ReceiptScanner < ActiveRecord::Base
  attr_accessible :business_percentage, :date, :email, :notes, :receipt_scanner_photo
  mount_uploader :receipt_scanner_photo, ReceiptScannerUploader
end