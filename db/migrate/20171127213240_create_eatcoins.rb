class CreateEatcoins < ActiveRecord::Migration[5.1]
  def change
    create_table :eatcoins do |t|
      t.integer :amount

      t.timestamps
    end
  end
end
