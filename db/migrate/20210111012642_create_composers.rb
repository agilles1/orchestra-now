class CreateComposers < ActiveRecord::Migration[6.0]
  def change
    create_table :composers do |t|
      t.string :full_name
      t.string :last_name
      t.datetime :birth_year
      t.datetime :death_year
      t.string :epoch

      t.timestamps
    end
  end
end
