class Dog < ActiveRecord::Migration[6.1]
  phase :structure

  def change
    create_table :dogs do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
