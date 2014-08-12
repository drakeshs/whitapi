class KeyDate < ActiveRecord::Base
  attr_accessible :month, :obligation, :tax_date, :title
  scope :keydates, ->(year,month){where("MONTH(tax_date) = ? and YEAR(tax_date) = ?", month,year)}
end

