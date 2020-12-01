class CreateMangas < ActiveRecord::Migration[5.2]
  def change
    create_table :mangas do |t|
      t.string :title
      t.string :author
      t.text :description
      t.timestamps
    end
  end
end
