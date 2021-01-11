class ChangeTypeToConcertInServiceTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :services, :type, :concert
  end
end
