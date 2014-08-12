class CreateNewsFeeds < ActiveRecord::Migration
  def change
    create_table :news_feeds do |t|
      t.integer :category_id
      t.string :news_image
      t.string :news_title
      t.string :category_name
      t.text :description
      t.date :news_date

      t.timestamps
    end
  end
end