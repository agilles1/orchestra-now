class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :title
      t.integer :composer_id

      t.timestamps
    end
  end
end
