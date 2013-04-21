class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :url
      t.string :author
      t.string :summary
      t.text :content
      t.datetime :published

      t.timestamps
    end
  end
end
