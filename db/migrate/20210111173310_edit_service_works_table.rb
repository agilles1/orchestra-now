class EditServiceWorksTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :service_works, :works_id, :work_id
  end
end
