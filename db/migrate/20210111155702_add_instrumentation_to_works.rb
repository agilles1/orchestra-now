class AddInstrumentationToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :insturmentation, :string
  end
end
