class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :model
      t.integer :price

      t.timestamps
    end
  end
end
