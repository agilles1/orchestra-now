class CreateServiceWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :service_works do |t|
      t.integer :order
      t.integer :service_id
      t.integer :works_id

      t.timestamps
    end
  end
end
