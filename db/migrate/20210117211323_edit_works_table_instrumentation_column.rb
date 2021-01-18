class EditWorksTableInstrumentationColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :works, :insturmentation, :instrumentation 
  end
end
