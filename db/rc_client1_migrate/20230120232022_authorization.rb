class Authorization < ActiveRecord::Migration[6.1]
  phase :data_migration
  def change
    create_table :authorizations do |t|
      t.string :name
      t.string :uuid

      t.timestamps
    end
  end
end
