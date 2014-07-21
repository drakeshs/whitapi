class CreateFutureRequests < ActiveRecord::Migration
  def change
    create_table :future_requests do |t|
      t.string :name
      t.integer :phone_number
      t.string :email
      t.text :suggestion

      t.timestamps
    end
  end
end