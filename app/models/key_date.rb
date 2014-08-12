class KeyDate < ActiveRecord::Base
  attr_accessible :month, :obligation, :tax_date, :title
  scope :keydates, ->(year,month){where('extract(year from tax_date) = ? and extract(month from tax_date) = ?', year,month)}
end


# where('extract(year from tax_date) = ? and extract(month from tax_date) = ?', month,year)