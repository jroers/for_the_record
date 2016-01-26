class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :kind
      t.decimal :value
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
