class FutureRequest < ActiveRecord::Base
  attr_accessible :email, :name, :phone_number, :suggestion
  validates_presence_of :email,:name,:suggestion
end