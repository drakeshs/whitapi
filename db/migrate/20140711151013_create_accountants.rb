class CreateAccountants < ActiveRecord::Migration
  def change
    create_table :accountants do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
