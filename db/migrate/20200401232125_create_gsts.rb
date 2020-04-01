class CreateGsts < ActiveRecord::Migration[6.0]
  def change
    create_table :gsts do |t|
      t.decimal :gst_rate

      t.timestamps
    end
  end
end
