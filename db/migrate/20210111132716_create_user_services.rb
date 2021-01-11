class CreateUserServices < ActiveRecord::Migration[6.0]
  def change
    create_table :user_services do |t|
      t.integer :user_id
      t.integer :service_id
      t.boolean :action

      t.timestamps
    end
  end
end
