class CreateAbouts < ActiveRecord::Migration[6.0]
  def change
    create_table :abouts do |t|
      t.string :title
      t.text :content
      t.string :creator_name

      t.timestamps
    end
  end
end
