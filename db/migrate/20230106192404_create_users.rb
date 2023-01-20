class CreateUsers < ActiveRecord::Migration[6.1]
  phase :structure
  def change
    create_table :users do |t|
      t.string :name
      t.string :email_address

      t.timestamps
    end
  end
end
