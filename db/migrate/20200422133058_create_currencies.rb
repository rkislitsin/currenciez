class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :name
      t.float :rate
      t.integer :num_code
      t.string :char_code

      t.timestamps
    end
  end
end
