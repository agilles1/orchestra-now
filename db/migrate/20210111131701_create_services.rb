class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :type

      t.timestamps
    end
  end
end
